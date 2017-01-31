class SessionsController < ApplicationController
  def new
    redirect_to "/auth/google"
  end

  def create
    @auth = request.env["omniauth.auth"]
    if !@auth.nil?
      create_user
    else
      create_provider
    end
    redirect_to root_path
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
    elsif session[:provider_id]
      session[:provider_id] = nil
    end
    flash[:notice] = "Signed Out"
    redirect_to root_path
  end

  private

  def create_user
    user = User.find_by_provider_and_uid(@auth["provider"], @auth["uid"]) || User.create_with_omniauth(@auth)
    session[:user_id] = user.id
    redirect_to ok_kyle_path
  end

  def create_provider
    provider = Provider.authenticate(params[:email], params[:password])
    if provider
      session[:provider_id] = provider.id
      redirect_to providers_path
    else
      flash[:notice] = "Authentication Problem"
      redirect_to log_in_path
    end
  end
end
