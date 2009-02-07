class UsersController < ApplicationController
  include AuthenticatedSystem

  before_filter :same_user, :only => [ :edit, :update ]
  before_filter :current_password_match, :only => :update

  def new
    @user = User.new
  end

  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      self.current_user = @user
      redirect_back_or_default('/')
      flash[:notice] = 'Thanks for signing up!'
    else
      flash[:error] = 'There were some errors creating your account.'
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
  end

  protected
    def same_user
      current_user.id == params[:id]
    end

    def current_password_match
      current_user.authenticated params[:current_password]
    end
end
