class SessionsController < ApplicationController
  def create
    Rails.logger.debug request.env
    @user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    redirect_to root_path
  end
end
