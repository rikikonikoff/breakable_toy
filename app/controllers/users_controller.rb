class UsersController < ApplicationController
  def new
    @user = User.new(oauth_uid: session[:auth]["uid"])
  end

  def create
    @info = session[:auth]["info"]
    @user = User.new(uid: session[:auth]["uid"])
    @user.name = @info["name"]
    @user.email = @info["email"]
    check_user_auth(@user)
  end

  def check_user_auth(user)
    if user.save
      session[:auth].clear
      session[:user_id] = user.id
      flash[:notice] = "Signed in as #{@user.name}"
      redirect_to user
    else
      flash[:notice] = "Couldn't sign in"
      redirect_to :back
    end
  end
end
