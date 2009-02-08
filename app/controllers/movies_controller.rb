class MoviesController < ApplicationController
  before_filter :login_required

  def index
    @movies = Movie.search(params[:search],
      :match_mode => :extended,
      :conditions => { :user_id => current_user.id }
    ) unless params[:search].blank?
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
