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
  end

  def create
    @movie = Movie.create_from_imdb params[:movie][:imdb]
    @media = @movie.media.create params[:media].merge(:user => current_user)
    redirect_to '/'
  end
end
