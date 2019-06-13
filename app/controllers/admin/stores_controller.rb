class Admin::StoresController < Admin::BaseController

  def index
    @stores = Store.all
  end
  
  def new
    @store = Store.new
  end

  def create
    @store = Store.create(store_params)
  end
  
  def store_params
    params.require(:store).permit(:name, :description, :location, :latitude, :tel, :main_img)
  end
end