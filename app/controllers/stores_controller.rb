class StoresController < ApplicationController
  
  def index
  end
  
  def initialize
  end

  def show
  @dishes = Dish.all
  end

  

end
