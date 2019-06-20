# frozen_string_literal: true
class AddTransactionNumberToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :transaction_number, :integer
  end
end
