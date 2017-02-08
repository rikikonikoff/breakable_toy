class ProvidersController < ApplicationController
    after_action :set_avatar!, only: [:create]

  def index
    @providers = Provider.all
  end

  def show
    @provider = Provider.find(params[:id])
    @appointments = @provider.appointments
    @insurers = @provider.insurers
    @insurer = Insurer.new
    @address = "#{@provider.work_address} #{@provider.city}
      #{@provider.state} #{@provider.zip}"
  end

  def new
    @provider = Provider.new(oauth_uid: session[:auth]["uid"])
    redirect_to providers_path, method: :post
  end

  def create
    @info = session[:auth]["info"]
    @provider = Provider.new(oauth_uid: session[:auth]["uid"])
    @provider.name = @info["name"]
    @provider.email = @info["email"]
    @provider.avatar = @info["image"]
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
    if @provider.save
      session[:auth].clear
      session[:provider_id] = @provider.id
      flash[:notice] = "Signed in as #{@provider.name}"
      redirect_to @provider
    else
      flash[:notice] = "Couldn't sign in"
      redirect_to :back
    end
  end

  def destroy
    @provider = Provider.find(params[:id])
    @provider.destroy
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
