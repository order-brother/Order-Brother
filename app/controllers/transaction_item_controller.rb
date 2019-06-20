class TransactionsItemController < ApplicationController
  include transactionsitemHelper
  transactionsItem_helper
  transactionsitemHelper
  before_action :authenticate_user!

  def add
      current_transaction.add_item(params[:id])
      redirect_to transaction_path, notice: '已加入購物車'
      

  end
end
  

