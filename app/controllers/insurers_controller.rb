class InsurersController < ApplicationController
  def index
    @insurers = Insurer.all
  end

  def create
    @insurer = Insurer.find_or_create_by(insurer_params)
    if signed_in_provider
      @insurance_provider = InsuranceProvider.new(insurer: @insurer, provider: current_user)
      if @insurance_provider.save
        flash[:notice] = "Insurance Added"
        redirect_to provider_path(current_user)
      else
        flash[:notice] = "You already have that listed"
        render "/providers/#{current_user.id}"
      end
    elsif signed_in_user
      @insurance_provider = InsuranceProvider.new(insurer: @insurer, user: current_user)
      if @insurance_provider.save
        flash[:notice] = "Insurance Added"
        redirect_to user_path(current_user)
      else
        flash[:notice] = "You already listed that insurance"
        render "/users/#{current_user.id}"
      end
    end
  end

  def update

  end

  def destroy
  end

  private

  def insurer_params
    params.require(:insurer).permit(:company, :plan)
  end
end
