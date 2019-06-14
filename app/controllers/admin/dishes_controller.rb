class Admin::DishesController < Admin::BaseController
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
  end

  private

  def dish_params
    # params.require(:dish).permit(:name, :price, :prepare_time, :state, :main_img, :store_id)
    params.require(:dish).permit(:name, :price, :prepare_time, :state, :main_img, :store_id)
  end
end