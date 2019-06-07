class TransactionItem < ApplicationRecord
  belongs_to :dish
  belongs_to :transaction_record, foreign_key: :transaction_id, class_name: :Transaction
end
