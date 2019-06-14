class Admin::DishesController < Admin::BaseController
  before_action :find_store, only: [:new, :create, :edit, :update, :destroy]

  def index
    @dish = Dish.all
  end

  def show
  end
  
  def new
    @store = Store.find(params[:store_id])
    @dish = @store.dishes.new
  end

  def create
    @store = Store.find(params[:store_id])
    if @store.dishes.create!(dish_params)
      render 'create'
    else

    end
  end

  def edit
  end

  def update
  end

  def destroy
    @dish.destroy!
    # FIXME
    render 'destroy'
  end

  private

  def find_store
    @store = Store.find(params[:store_id])
  end

  def dish_params
    # params.require(:dish).permit(:name, :price, :prepare_time, :state, :main_img, :store_id)
    params.require(:dish).permit(:name, :price, :prepare_time, :state, :main_img, :store_id)
  end
end