class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    provider = Provider.from_omniauth(env["omniauth.auth"])
    if user
      session[:user_id] = user.id
    else
      session[:provider_id] = provider.id
    end
    redirect_to root_path
  end

  def destroy
    if session[:provider_id].nil?
      session[:user_id] = nil
    else
      session[:provider_id] = nil
    end
    redirect_to root_path
  end
end
