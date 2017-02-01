class ProvidersController < ApplicationController
  def index
    @providers = Provider.all
  end

  def show
    @provider = Provider.find(params[:id])
    @appointments = @provider.appointments
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
    if @provider.save
      session[:auth].clear
      session[:provider_id] = @provider.id
      @provider.touch :last_signed_in_at
      @provider.increment! :sign_in_count
      flash[:notice] = "Signed in as #{@provider.name}"
      redirect_to @provider
    else
      flash[:notice] = "Couldn't sign in"
      redirect_to :back
    end
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
      :profile_url
    )
  end
end
