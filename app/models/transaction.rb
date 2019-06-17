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

  # TODO 寫一個方法根據所含的 transaction_items 計算總價


  after_save :set_serial_number

  def set_serial_number
    self.serial_number = ("%08d" % self.id).to_s
  end

end
