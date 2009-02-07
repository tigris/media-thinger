class EpisodesController < ApplicationController
  before_filter :login_required

  def index
    @movies = current_user.movies
  end

  def new
    @movie = Episode.new
  end

  def create
    @episode = Episode.create params[:episode]
    @media = @episode.media.create params[:episode].merge(:user => current_user)
    redirect_to '/'
  end
end
