class Admin::TransactionsController < Admin::BaseController
  before_action :find_store, only: %i[index show]
  before_action :authenticate_user!

  def index
    if (current_user.stores.ids.include? @store.id) || (current_user.role == 'admin')
      @transactions = @store.transactions
    else
      redirect_to(request.referrer || root_path)
    end

    # options 2:
    # @transactions = policy_scope(Transaction)
  end

  # def show
  #   @transaction = Transaction.includes(:user, :dish).find(params[:id])
  # end

  def new
  end

  def create
    byebug
    ## 以下為參考用
    @store = Store.find(params[:store_id])
    @transaction = @store.transactions.create(user: current_user, total_price: 0)

    transaction.description = return_order[:description]
    transaction.description = return_order[:pick_up_time]


    return_order[:transaction_item].each do |_index, col|
      t = transaction.transaction_items.new(col)
      t.save!
    end

    # 收集參數，建立 TransactionItem

    # @transaction.description = params[:transaction][:description]
    # @transaction.description = params[:transaction][:pick_up_time]
    # # params[:transaction][:transaction_item].each do |index, value|
    # #   # item[:custom_fields] = item[:custom_field] if item[:custom_fields].nil? && item[:custom_field]
    # #   @transaction.transaction_items.new()
    # #   @transaction.transaction_items

    # #   # transaction_item.set_value_with_params(item)
    # # end

  end

  def edit
    # @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update(transaction_params)
      render 'update'
    else
      render 'edit'
    end
  end

  def destroy
  end

  def state
    @transaction = Transaction.find(params[:id])
    case params[:state]
    when 'accept'
      @transaction.accept!
      render 'state'
    when 'modify'
      @transaction.modify!
      render 'edit'
    when 'reject'
      @transaction.reject!
      render 'state'
    end
  end

  private

  def return_order
    {
      :description => 'text_here',
      :pick_up_time => 'Wed, 19 Jun 2019 21:17:38 CST +08:00>',
      :transaction_item => build_dish_item
    }
  end

  def build_dish_item
    dishes = JSON.parse(params[:dishes]) rescue {}
    dishes = { "10": 1, "19": 2 }
    rs = {}
    dishes.each do |k, v|
      rs["item#{k}"] = {
        'dish_id' => k,
        'dish_count' => v,
        'item_price' => Dish.find(k).price * v
      }
    end
    rs
  end

  def build_dish_item2
    dishes = JSON.parse(params[:dishes]) rescue {}
    # dishes = { "10": 1, "19": 2 }
    ids = dishes.map { |k, _| k.to_i }
    rs = {}
    Dish.where(id: ids).each do |dish|
      count = dishes[dish.id.to_s].to_i
      rs["item#{dish.id}"] = {
        'dish_id' => dish.id,
        'dish_count' => count,
        'item_price' => dish.price * count
      }
    end
    rs
  end

  def find_store
    @store = Store.includes(transactions: [:user, transaction_items: [:dish]]).find(params[:store_id])
  end

  def transaction_params
    params.require(:transaction).permit(:description, :pick_up_time)
  end
end
