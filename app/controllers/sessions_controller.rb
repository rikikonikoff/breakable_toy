class SessionsController < ApplicationController
  def create
    @auth = request.env["omniauth.auth"]
    @type = request.env["omniauth.params"]["session_type"]
    if @type == "provider"
      create_provider
    elsif @type == "user"
      create_user
    end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
    elsif session[:provider_id]
      session[:provider_id] = nil
    end
    session[:auth] = nil
    flash[:notice] = "Signed Out"
    redirect_to root_path
  end

  def create_provider
    provider = Provider.find_by_provider_and_uid(@auth["provider"], @auth["uid"]) || Provider.create_with_omniauth(@auth)
    session[:provider_id] = provider.id
    redirect_to provider_path(provider)
  end

  def create_user
    user = User.find_by_provider_and_uid(@auth["provider"], @auth["uid"]) || User.create_with_omniauth(@auth)
    session[:user_id] = user.id
    redirect_to appointments_path
  end
end
