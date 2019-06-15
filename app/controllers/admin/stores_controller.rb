class Admin::StoresController < Admin::BaseController
  before_action :find_store, only: [:show, :edit, :update, :destroy]
  
  def index
    @stores = Store.all
  end
  
  def new
    @store = Store.new
  end

  def show
    # @store = Store.find(current_user.id)
  end

  def create
    @store = Store.new(store_params)
    @store.user = current_user
    if @store.save
      redirect_to admin_store_path(@store), notice: '新增成功！'
    else
      render :new
    end
  end
  
  def edit
    # 驗證店主 或 管理員
    authorize @store
  end

  def update
    # authorize @store
    # byebug
    if @store.update(store_params)
      redirect_to admin_store_path, notice: '更新成功！'
    else
      render :edit
    end
  end

  def destroy
    # 驗證店主 或 管理員
    authorize @store
    @store.destroy!
    redirect_to root_path, notice: '商店已刪除'
  end
  
  private

  def find_store
    @store = Store.includes(:dishes).find_by(id: params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :description, :location, :latitude, :tel, :main_img)
  end
end