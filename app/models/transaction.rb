class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :store
  has_many :transaction_items
end
