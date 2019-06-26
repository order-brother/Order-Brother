class Admin::TransactionsController < Admin::BaseController
  before_action :find_store, only: %i[index show]
  before_action :find_transaction, only: %i[accept modify reject pick]
  before_action :authenticate_user!

  def index
    if (current_user.stores.ids.include? @store.id) || (current_user.role == 'admin')
      @transactions = @store.transactions.order(created_at: :desc)
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
    ## 以下為參考用
    @store = Store.find(params[:store_id])
    @transaction = @store.transactions.create(user: current_user, total_price: 0)
  
    @transaction.pick_up_time = default_pick_up_time(params[:time])

    @transaction.description = params[:description]
    @transaction.save

    build_dish_item.each do |_index, col|
      t = @transaction.transaction_items.new(col)
      t.save!
    end

  end


  def edit
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

  def accept
    @transaction.accept!
    render 'state_change'
  end

  def modify
    @transaction.modify!
    render 'edit'
<<<<<<< HEAD
  end

  def reject
    @transaction.reject!
    render 'state_change'
  end

=======
  end

  def reject
    @transaction.reject!
    render 'state_change'
  end

>>>>>>> ba90186e912b2cb08ee20ba8470fbd823d087d32
  def pick
    @transaction.pick!
    render 'state_change'
  end

  # 舊版寫法參考用
  # def act
  #   @transaction = Transaction.find(params[:id])
  #   case params[:act]
  #   when 'accept'
  #     @transaction.accept!
  #     render 'act'
  #   when 'modify'
  #     @transaction.modify!
  #     render 'edit'
  #   when 'pick'
  #     @transaction.pick!
  #     render 'act'
  #   when 'reject'
  #     @transaction.reject!
  #     render 'act'
  #   end
  # end

  private

  def default_pick_up_time(current_time = Time.now + 30.minutes)
    current_time = Time.parse(current_time)
    current_time ||= Time.now + 30.minutes
    current_time.strftime("%Y-%m-%dT%H:%M")
  end

  def find_store
    @store = Store.includes(transactions: [:user, transaction_items: [:dish]]).find(params[:store_id])
  end

  def transaction_params
    params.require(:transaction).permit(:description, :pick_up_time)
  end

  def find_transaction
    @transaction = Transaction.find(params[:id])
  end
end
