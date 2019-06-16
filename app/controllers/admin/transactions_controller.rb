class Admin::TransactionsController < ApplicationController
  before_action :find_store, only: [:index, :show]

  def index
    @transactions = @store.transactions
  end

  def show
    @transaction = Transaction.find(params[:id]).includes(:user, :dish)
  end
  
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_store
    @store = Store.includes(:transactions).find(params[:store_id])
  end
end
