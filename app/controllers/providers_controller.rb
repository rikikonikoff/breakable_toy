class ProvidersController < ApplicationController
  def index
    binding.pry
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
    binding.pry
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

  def destroy
    @provider = Provider.find(params[:id])
    @provider.destroy
  end
end
