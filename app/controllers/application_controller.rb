class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if signed_in_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    elsif signed_in_provider
      @current_user ||= Provider.find(session[:admin_id]) if session[:provider_id]
    else
      nil
    end
  end

  def signed_in_user
    !session[:user_id].nil?
  end

  def signed_in_provider
    !session[:provider_id].nil?
  end
end
