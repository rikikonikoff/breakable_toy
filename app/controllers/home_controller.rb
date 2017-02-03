class HomeController < ApplicationController
  def show
    @provider = Provider.new
    @user = User.new
    @auth = session[:auth]
    create_row
  end

  def create_row
    if params[session_type: "provider"]
      @provider = Provider.from_omniauth(@auth)
      redirect_to provider_path(@provider)
    elsif params[session_type: "user"]
      @user = User.from_omniauth(@auth)
      redirect_to appointments_path
    end
  end
end
