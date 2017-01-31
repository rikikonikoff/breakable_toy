class SessionsController < ApplicationController
  def new
  end

  def create
    @auth = request.env["omniauth.auth"]
    binding.pry
    if params[session_type: "provider"]
      @provider = Provider.from_omniauth(@auth)
      redirect_to @provider
    elsif params[session_type: "user"]
      User.from_omniauth(@auth)
      redirect_to appointments_path
    end
    redirect_to root_path
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
end
