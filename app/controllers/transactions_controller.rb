class TransactionsController < ApplicationController
  before_action :find_transaction, only: %i[modify save_draft cancel]

  def index
    @transactions = current_user.transactions.order('created_at desc')
  end

  def create
    @store = Store.find(params[:store_id])
    @transaction = @store.transactions.create(user: current_user, total_price: 0)

    @transaction.pick_up_time = default_pick_up_time(params[:time])
    
    @transaction.description = (params[:description])
    @transaction.save

    build_dish_item.each do |_index, col|
      t = @transaction.transaction_items.new(col)
      t.save!
    end
  end

  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update(transaction_params)
      render 'update'
    else
      render 'edit'
    end
  end

  def modify
    @transaction.modify!
    render 'edit'
  end

  def save_draft
    @transaction.save_draft!
    render 'state_change'
  end

  def cancel
    @transaction.cancel!
    render 'state_change'
  end

  private

  def find_transaction
    @transaction = Transaction.find(params[:id])
  end

  def build_dish_item
    dishes = JSON.parse(params[:dishes]) rescue {}
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

  def default_pick_up_time(current_time = Time.now + 30.minutes)
    current_time = Time.parse(current_time)
    current_time ||= Time.now + 30.minutes
    current_time.strftime("%Y-%m-%dT%H:%M")
  end

  def transaction_params
    params.require(:transaction).permit(:description, :pick_up_time)
  end
end
