class CreateTransactionItems < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_items do |t|
      t.references :transaction, foreign_key: true, index: true
      t.references :dish, foreign_key: true, index: true
      t.integer :dish_count, null: false
      t.decimal :item_price

      t.timestamps
    end
  end
end
