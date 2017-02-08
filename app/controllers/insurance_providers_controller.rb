class InsuranceProvidersController < ApplicationController
  def create
    InsuranceProvider.create(insurance_params)
  end

  def destroy
    @insurance_provider = InsuranceProvider.find(params[:id])
    if @insurance_provider.destroy
      flash[:notice] = "Insurance Removed"
    else
      flash[:notice] = "There was an error removing your insurance"
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def insurance_params
    params.require(:insurance_provider).permit(:insurer, :provider, :user)
  end
end
