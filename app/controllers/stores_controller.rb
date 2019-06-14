class StoresController < ApplicationController
  before_action :find_store, only: [:show]
  
  def index
  end

   
  

  def show
    @store = Store.find(params[:id]) 
    # @dishes = @store.dishes
  end
  private

  def find_store
    @store = Store.find_by(id: params[:id])
  end

  def store_params
  params.require(:store).permit(:name, :description, :tel)
end

end
