class MoviesController < ApplicationController
  before_filter :login_required

  def index
    @movies = current_user.movies
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create params[:movie]
    @media = @movie.media.create params[:media].merge(:user => current_user)
    redirect_to '/'
  end
end
