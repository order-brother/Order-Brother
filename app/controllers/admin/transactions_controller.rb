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

  def act
    @transaction = Transaction.find(params[:id])
    case params[:act]
    when 'accept'
      @transaction.accept!
      render 'act'
    when 'modify'
      @transaction.modify!
      render 'edit'
    when 'pick'
      @transaction.pick!
      render 'act'
    when 'reject'
      @transaction.reject!
      render 'act'
    end
  end

  private

  def default_pick_up_time(current_time = Time.now + 30.minutes)
    current_time = Time.parse(current_time)
    current_time ||= Time.now + 30.minutes
    current_time.strftime("%Y-%m-%dT%H:%M")
  end

  def return_order
    {
      :description => 'text_here',
      :pick_up_time => 'Wed, 19 Jun 2019 21:17:38 CST +08:00>',
      :transaction_item => build_dish_item
    }
  end

  def find_store
    @store = Store.includes(transactions: [:user, transaction_items: [:dish]]).find(params[:store_id])
  end

  def transaction_params
    params.require(:transaction).permit(:description, :pick_up_time)
  end
end
