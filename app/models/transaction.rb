class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :store
  has_many :transaction_items, dependent: :destroy

  acts_as_paranoid
end
