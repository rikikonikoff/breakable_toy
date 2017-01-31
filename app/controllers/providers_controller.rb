class ProvidersController < ApplicationController
  def index
    @providers = Provider.all
  end

  def show
    @provider = Provider.find(params[:id])
    @appointments = @provider.appointments
  end

  def new
    @provider = Provider.new
  end

  def create
    @provider = provider.new(provider_params)
    if @provider.save
      redirect_to providers_path
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
    params.require[:provider].permit[:name, :email, :password, :password_confirmation]
  end
end
