class MoviesController < ApplicationController
  before_filter :login_required

  def index
    # TODO: I hate building search constructs like this. Brings back memories of
    # DBI perl days. Does A::R support like searches somehow? I'll probably be
    # converting to sphinx/ferret at some point anyway, even if it is overkill
    # to run a whole external daemon for ~1000 records.
    search_terms = {}
    sql = '1=1'
    unless params['title'].nil?
      sql += %q( and lower(title) like :title)
      search_terms[:title] = "%#{params[:title].downcase}%"
    end
    @movies = current_user.movies.find(:all, :conditions => [ sql, search_terms ]) unless search_terms.blank?
  end

  def new
    @movie = Movie.new
    @media = Media.new
  end

  def create
    unless imdb_id = parse_imdb_id(params[:movie][:imdb])
      flash[:failure] = 'Not a valid IMDB URL.'
      redirect_to new_movie_path
    end
    @movie = Movie.find_by_imdb(imdb_id) || Movie.create_from_imdb(imdb_id)
    @media = @movie.media.create params[:media].merge(:user => current_user)
    if @media.errors
      render :action => 'new'
    else
      flash[:notice] = 'Movie successully added to your library'
      redirect_to '/'
    end
  end
end
