class MediaController < ApplicationController
  before_filter :login_required

  def index
    @entries = ThinkingSphinx::Search.search(params[:search],
      :match_mode => :extended,
      :conditions => { :user_id => current_user.id }
    ) unless params[:search].blank?
  end

  def new
    @media = Media.new
  end

  def create
    @media = Media.create params[:media].merge(:user => current_user)
    if @media.errors.size > 0
      render :action => 'new'
    else
      flash[:notice] = 'Movie successully added to your library'
      redirect_to '/'
    end
  end
end
