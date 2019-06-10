class AddressController < ApplicationController
  def index
    @address = Address.all
  end
end