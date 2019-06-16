class AddDeletedAtToTransactionItems < ActiveRecord::Migration[5.2]
  def change
    add_column :transaction_items, :deleted_at, :datetime
    add_index :transaction_items, :deleted_at
  end
end
