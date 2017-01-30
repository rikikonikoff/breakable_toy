class UsersController < ApplicationController

  def index
    @providers = Provider.all
  end
end
