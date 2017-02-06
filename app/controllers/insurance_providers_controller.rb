class InsuranceProvidersController < ApplicationController
  def index
  end

  def create
    InsuranceProvider.create(insurance_params)
  end

  def destroy
    @insurance_provider = InsuranceProvider.find(params[:id])
    if @insurance_provider.destroy
      flash[:notice] = "Insurance Removed"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "There was an error removing your insurance"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def insurance_params
    params.require(:insurance_provider).permit(:insurer, :provider, :user)
  end
end
