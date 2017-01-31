class User::SessionsController < ApplicationController
  def new
    redirect_to "/user/auth/google/callback"
  end

  def create
    @auth = request.env["omniauth.auth"]
    user = User.from_omniauth(@auth)
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
      session[:auth] = nil
    end
    flash[:notice] = "Signed Out"
    redirect_to root_path
  end
end
