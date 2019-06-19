class TransactionController < ApplicationController
  def create
    dishes = JSON.parse(params[:dishes])
    byebug
  end
  
end
  

