class Admin::DishesController < Admin::BaseController
  before_action :find_store, only: %i[new create]
  before_action :find_dish, only: %i[edit update cancel destroy]

  def index
    @dish = Dish.all
  end

  def show
  end

  def new
    @dish = @store.dishes.new
    @url = admin_store_dishes_path(@store, @dish)
    @method = :post
  end

  def create
    @dish = @store.dishes.build(dish_params)
    if @dish.save
      render 'create', noteice: '商品新增成功'
    else
      @url = admin_store_dishes_path(@store, @dish)
      @method = :post
      render 'new'
    end
  end

  def edit
    @url = admin_dish_path(@dish)
    @method = :patch
  end

  def update
    @store = @dish.store
    if @dish.update(dish_params)
      render 'update'
    else
      @url = admin_dish_path(@dish)
      @method = :patch
      render 'edit'
    end
  end

  def cancel
    @store = @dish.store
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
    params.require(:dish).permit(:name, :price, :prepare_time, :state, :main_img, :store_id)
  end
end
