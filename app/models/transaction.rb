class Transaction < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :store
  has_many :transaction_items, dependent: :destroy

  acts_as_paranoid

  enum state: %i[pending waiting_pick_up rejected closed canceled]
  aasm column: 'state' do
    state :pending, initial: true
    state :accepted, :waiting_pick_up, :rejected, :closed, :canceled

    # TODO 進入 pending 的時候 callback job 讓他倒數五分鐘
    event :accept do
      transitions from: :pending, to: :waiting_pick_up
    end

    event :pick do
      transitions from: :waiting_pick_up, to: :closed
    end

    event :cancel do
      transitions from: %i[pending waiting_pick_up], to: :canceled
    end

    # FIXME 店家可以不經過客戶同意自己修改訂單，再自己接受
    event :modify do
      transitions from: %i[pending waiting_pick_up], to: :pending
    end

    event :reject do
      transitions from: %i[pending waiting_pick_up], to: :rejected
    end
  end

  after_save :set_serial_number, :total_price

  def set_serial_number
    return if serial_number.present?

    serial_number = ('%08d' % id).to_s
    update_columns(serial_number: serial_number)
  end

  def total_price
    self.total_price = transaction_items.reduce(0) { |sum, ti| sum + (Dish.find(ti.dish_id).price * ti.dish_count) }
  end
end
