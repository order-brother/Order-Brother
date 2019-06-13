class AddressController < ApplicationController
  def index
    @api_key = ENV['google_map_api']
  end
end