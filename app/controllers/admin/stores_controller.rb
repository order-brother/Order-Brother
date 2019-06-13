class Admin::StoresController < Admin::BaseController

  def index
    @stores = Store.all
  end
  
  def new
    @store = Store.new
  end

  def show
    @store = Store.find(params[:id])
  end

  def create
    @store = Store.new(store_params)
    @store.user = current_user
    @store.save!
    redirect_to admin_store_path(@store)
    # byebug
  end
  
  def store_params
    params.require(:store).permit(:name, :description, :location, :latitude, :tel, :main_img)
  end
end