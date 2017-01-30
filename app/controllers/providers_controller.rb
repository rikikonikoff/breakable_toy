class ProvidersController < ApplicationController
  def index
    @providers = Provider.all
  end

  def show
    @provider = Provider.find(params[:id])
    @appointments = @provider.appointments
  end

  def destroy
    @provider = Provider.find(params[:id])
    @provider.destroy
  end
end
