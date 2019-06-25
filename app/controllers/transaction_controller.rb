class TransactionController < ApplicationController
  def index
    @transactions = current_user.transactions.order('created_at desc')
  end

  def create
    dishes = JSON.parse(params[:dishes])
  end
end
