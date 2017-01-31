class Users::SessionsController < ApplicationController
  def new
    redirect_to "/users/auth/google"
  end

  def create
    @auth = request.env["omniauth.auth"]
    if !@auth.nil?
      User.find_or_create_from_omniauth(@auth)
    end
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
