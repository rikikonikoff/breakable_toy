class Api::V1::ProvidersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    providers = Provider.all
    @providers = providers.sort_by { |each| each.name }
    render json: @providers
  end

  def show
    render json: [current_user]
  end
end
