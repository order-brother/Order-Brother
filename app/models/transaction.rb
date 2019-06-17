class Transaction < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :store
  has_many :transaction_items, dependent: :destroy

  acts_as_paranoid

  enum state: [:pending, :waiting_pick_up, :rejected, :closed, :canceled]
  aasm column: 'state' do
    state :pending, initial: true
    state :accepted, :waiting_pick_up, :rejected, :closed, :canceled

    event :accept do
      transitions from: :pending, to: :waiting_pick_up
    end

    event :pick do
      transitions from: :waiting_pick_up, to: :closed
    end

    event :cancel do
      transitions from: [:pending, :waiting_pick_up], to: :canceled
    end

    event :modify do
      transitions from: [:pending, :waiting_pick_up], to: :pending
    end

    event :reject do
      transitions from: [:pending, :waiting_pick_up], to: :rejected
    end
  end

  
  after_save :set_serial_number, :total_price
  
  def set_serial_number
    self.serial_number = ("%08d" % self.id).to_s
  end
  
  def total_price
    self.total_price = self.transaction_items.reduce(0) { |sum, transaction_item| sum + (transaction_item.item_price * transaction_item.dish_count) }
  end
end
