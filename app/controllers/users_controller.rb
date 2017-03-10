class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    appointments = @user.appointments
    @appointments = appointments.sort_by { |a| [a.date, a.start_time] }
    @insurers = @user.insurers
    @insurer = Insurer.new
  end

  def new
    @user = User.new(uid: session[:auth]["uid"])
  end

  def create
    @info = session[:auth]["info"]
    @user = User.new(uid: session[:auth]["uid"])
    @user.name = @info["name"]
    @user.email = @info["email"]
    check_user_auth(@user)
  end

  def edit
    @user = nil
    if signed_in_user
      @user = current_user
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Profile Updated Successfully"
      redirect_to @user
    else
      flash[:notice] = @user.errors.full_messages.to_sentence
      render :edit
    end
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

  private

  def user_params
    params.require(:user).permit(:name, :email, :address, :city, :state, :zip)
  end
end
