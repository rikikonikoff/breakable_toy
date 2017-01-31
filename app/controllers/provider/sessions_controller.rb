class Providers::SessionsController < ApplicationController
  def new
    redirect_to "/provider/auth/google/callback"
  end

  def create
    @auth = request.env["omniauth.auth"]
    provider = Provider.from_omniauth(@auth)
    session[:provider_id] = provider.id
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
