class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def signed_in_user
    !session[:user_id].nil?
  end

  def signed_in_provider
    !session[:provider_id].nil?
  end

  def current_user
    if signed_in_user
      @current_user ||= User.find(session[:user_id])
    elsif signed_in_provider
      @current_user ||= Provider.find(session[:provider_id])
    else
      @current_user = nil
    end
    @current_user
  end
end
