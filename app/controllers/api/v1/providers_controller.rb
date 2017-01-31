class Api::V1::ProvidersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @providers = Provider.all

    if params[:search]
      @providers = Provider.search(params[:search])
    end

    render json: @providers
  end
end
