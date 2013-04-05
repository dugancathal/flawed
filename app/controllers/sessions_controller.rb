class SessionsController < ApplicationController
  def create
    @user = User.where(username: params[:username]).first
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), :notice => "Logged in!"
    else
      flash.now.alert = "Invalid username or password"
      render "pages/home"
    end
  end

  def fb_create
    Rails.logger.debug request.env
    @user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session[:user_id] = nil
    redirect_to pages_home_path, notice: 'Come back soon'
  end
end
