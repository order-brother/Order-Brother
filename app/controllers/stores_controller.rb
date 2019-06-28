class StoresController < ApplicationController
  before_action :find_store, only: [:show]

  def index
    # Fuzzy search "ILIKE" is pg only
    # search: # => keyword argument
    @stores = list_stores(search: params[:search])
    render 'page/index'
  end

  def show
    @store = Store.find(params[:id])
    # @dishes = @store.dishes
  end

  private

  def list_stores(search: nil)
    return Store.all if search.nil?

    Store.where('name ILIKE ?', "%#{params[:search]}%")
  end

  def find_store
    @store = Store.find_by(id: params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :description, :tel)
  end

end
