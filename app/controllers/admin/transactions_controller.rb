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
      :transaction_item => {
        :item1 => {
          'dish_id' => d1.id,
          'dish_count' => 1,
          'item_price' => 2999
        },
        :item2 => {
          'dish_id' => d2.id,
          'dish_count' => 1,
          'item_price' => 199
        }
      }
    }
  end

  def find_store
    @store = Store.includes(transactions: [:user, transaction_items: [:dish]]).find(params[:store_id])
  end

  def transaction_params
    params.require(:transaction).permit(:description, :pick_up_time)
  end
end
