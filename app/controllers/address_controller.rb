class AddressController < ApplicationController
  def index
    @address = Address.all
    @api_key = ENV['google_map_api']
  end
end