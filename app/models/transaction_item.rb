class TransactionItem < ApplicationRecord
  belongs_to :dish
  # ! FIXME 'transaction' 名稱和 Active Record 的方法衝突:
  # ArgumentError: You tried to define an association named transaction on the model TransactionItem, but this will conflict with a method transaction already defined by Active Record. Please choose a different association name.
  belongs_to :transact, class_name: :transaction
end
