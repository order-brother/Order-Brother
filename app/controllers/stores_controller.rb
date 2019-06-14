class StoresController < ApplicationController
  
  def index
  end
  
  def initialize
  end

  def show
  @dishes = Dish.all
  @stores = Store.all
  end

end
