class TransactionController < ApplicationController
  before_action :find_transaction, only: %i[modify save_draft cancel]

  def index
    @transactions = current_user.transactions
  end

  # WIP 搬移 admin transactions_controller
  def create
    @store = Store.find(params[:store_id])
    @transaction = @store.transactions.create(user: current_user, total_price: 0)

    @transaction.description = build_dish_item[:description]
    @transaction.description = build_dish_item[:pick_up_time]

    build_dish_item.each do |_index, col|
      t = @transaction.transaction_items.new(col)
      t.save!
    end
  end

  def modify
    @transaction.modify!
    # WIP redirect to edit page
    render 'edit'
  end

  def save_draft
    # WIP redirect to transaction index
    @transaction.save_draft!
    render ''
  end

  def cancel
    @transaction.cancel!
    render ''
  end

  private

  def find_transaction
    @transaction = Transaction.find(params[:id])
  end

  def build_dish_item
    dishes = JSON.parse(params[:dishes]) rescue {}
    # dishes = { "10": 1, "19": 2 }
    ids = dishes.map { |k, _| k.to_i }
    rs = {}
    Dish.where(id: ids).each do |dish|
      count = dishes[dish.id.to_s].to_i
      rs["item#{dish.id}"] = {
        'dish_id' => dish.id,
        'dish_count' => count,
        'item_price' => dish.price
      }
    end
    rs
  end

  def transaction_params
    params.require(:transaction).permit(:description, :pick_up_time)
  end
end
