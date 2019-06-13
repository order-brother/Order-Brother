class StoresController < ApplicationController


  def store_params
    params.require(:store).permit(:name, :description, :location, :latitude, :tel, :main_img)
  end
end