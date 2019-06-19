class Admin::TransactionsController < Admin::BaseController
  before_action :find_store, only: [:index, :show]
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
    ## 以下為參考用：
    @transaction.new
    # 收集參數，建立 TransactionItem
    # params[:transaction][:transaction_item].each do |_index, item|
    #   item[:custom_fields] = item[:custom_field] if item[:custom_fields].nil? && item[:custom_field]
    #   transaction_item = @transaction.transaction_items.new()
    #   transaction_item.set_value_with_params(item)
    # end
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

  def find_store
    @store = Store.includes(transactions: [:user, transaction_items: [:dish]]).find(params[:store_id])
  end

  def transaction_params
    params.require(:transaction).permit(:description, :pick_up_time)
  end
end
