class UsersController < ApplicationController
  def new
    @user = User.new(oauth_uid: session[:auth]["uid"])
  end

  def create
    @info = session[:auth]["info"]
    @user = User.new(oauth_uid: session[:auth]["uid"])
    @user.name = @info["name"]
    @user.email = @info["email"]
    if @user.save
      session[:auth].clear
      session[:user_id] = @user.id
      @user.touch :last_signed_in_at
      @user.increment! :sign_in_count
      flash[:notice] = "Signed in as #{@user.name}"
      redirect_to @user
    else
      flash[:notice] = "Couldn't sign in"
      redirect_to :back
    end
  end

end
