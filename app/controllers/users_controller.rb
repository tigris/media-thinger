class UsersController < ApplicationController
  include AuthenticatedSystem

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
end
