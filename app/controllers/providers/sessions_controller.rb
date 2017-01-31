class Providers::SessionsController < ApplicationController
  def new
    redirect_to "/providers/auth/google"
  end

  def create
    @auth = request.env["omniauth.auth"]
    if !@auth.nil?
      Provider.find_or_create_from_omniauth(@auth)
    end
    redirect_to root_path
  end

  def destroy
    if session[:provider_id]
      session[:provider_id] = nil
      session[:auth] = nil
    end
    flash[:notice] = "Signed Out"
    redirect_to root_path
  end
end
