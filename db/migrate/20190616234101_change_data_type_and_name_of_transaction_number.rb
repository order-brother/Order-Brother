# frozen_string_literal: true
class ChangeDataTypeAndNameOfTransactionNumber < ActiveRecord::Migration[5.2]
  def self.up
    rename_column :transactions, :transaction_number, :serial_number
    change_column :transactions, :serial_number, :string
  end
  
  def self.down
    rename_column :transactions, :serial_number, :transaction_number
    change_column :transactions, :transaction_number, :integer
  end
end
