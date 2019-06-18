class Admin::TransactionsController < Admin::BaseController
  before_action :find_store, only: [:index, :show]
  before_action :authenticate_user!

  def index
      # 驗證店主 或 管理員
    if current_user.stores.ids.include? @store.id
      # 通過驗證才能取得資料
      @transactions = @store.transactions
    else
      # 否則回到前頁 或 首頁
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
    # params[:items].each do |_index, item|
    #   item[:custom_fields] = item[:custom_field] if item[:custom_fields].nil? && item[:custom_field]
    #   transaction_item = @transaction.transaction_items.new()
    #   transaction_item.set_value_with_params(item)
    # end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  def state
    @transaction = Transaction.find(params[:id])
    case params[:state]
    when 'accept'
      @transaction.accept!
    when 'modify'
      @transaction.modify!
    when 'reject'
      @transaction.reject!
    end
    render 'state'
  end

  private

  def find_store
    @store = Store.includes(transactions: [:user, transaction_items: [:dish]]).find(params[:store_id])
  end

  def transaction_params
    params.require(:id_name).permit(:variable)
  end
end
