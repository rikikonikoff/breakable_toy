class ProvidersController < ApplicationController
  def index; end

  def show
    @provider = Provider.find(params[:id])
    appointments = @provider.appointments
    @appointments = appointments.sort_by { |a| [a.date, a.start_time] }
    @insurers = @provider.insurers
    @insurer = Insurer.new
    @address = "#{@provider.work_address} #{@provider.city}
      #{@provider.state} #{@provider.zip}"
    @profile = @provider.profile
  end

  def new
    @provider = Provider.new(uid: session[:auth]["uid"])
    redirect_to providers_path, method: :post
  end

  def create
    @info = session[:auth]["info"]
    @provider = Provider.new(uid: session[:auth]["uid"])
    @provider.name = @info["name"]
    @provider.email = @info["email"]
    @provider.remote_avatar_url = @info["image"]
    check_provider_auth(@provider)
  end

  def edit
    @provider = nil
    if signed_in_provider
      @provider = current_user
    end
  end

  def update
    @provider = Provider.find(params[:id])
    if @provider.update(provider_params)
      flash[:notice] = "Profile Updated Successfully"
      redirect_to @provider
    else
      flash[:notice] = @provider.errors.full_messages.to_sentence
      render :edit
    end
  end

  def check_provider_auth(provider)
    if provider.save
      session[:auth].clear
      session[:provider_id] = provider.id
      flash[:notice] = "Signed in as #{provider.name}"
      redirect_to provider
    else
      flash[:notice] = "Couldn't sign in"
      redirect_to :back
    end
  end

  def destroy
    @provider = Provider.find(params[:id])
    @provider.appointments.destroy_all
    @provider.insurance_providers.destroy_all
    session.destroy
    if @provider.destroy
      flash[:notice] = "Profile Deleted"
      redirect_to root_path
    else
      flash[:notice] = "There was an error deleting your profile"
      render :show
    end
  end

  private

  def provider_params
    params.require(:provider).permit(
      :name,
      :email,
      :work_address,
      :city,
      :state,
      :zip,
      :bio,
      :profile,
      :avatar
    )
  end

  def insurer_params
    params.require(:insurer).permit(:company, :plan)
  end
end
