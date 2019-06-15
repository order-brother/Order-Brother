class Admin::DishesController < Admin::BaseController
  before_action :find_store, only: [:new, :create]
  before_action :find_dish, only: [:edit, :update, :destroy]

  def index
    @dish = Dish.all
  end

  def show
  end
  
  def new
    @dish = @store.dishes.new
  end

  def create
    if @store.dishes.create(dish_params)
      render 'create'
    else
    end
  end

  def edit
  end

  def update
    @store = @dish.store
    @dish.update!(dish_params)
    render 'update'
  end

  def destroy
    @store = @dish.store
    @dish.destroy!
    render 'destroy'
  end

  private

  def find_store
    @store = Store.find(params[:store_id])
  end

  def find_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    # params.require(:dish).permit(:name, :price, :prepare_time, :state, :main_img, :store_id)
    params.require(:dish).permit(:name, :price, :prepare_time, :state, :main_img, :store_id)
  end
end