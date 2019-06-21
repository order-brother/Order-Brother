# frozen_string_literal: true
class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.decimal :total_price, null: false
      t.text :description
      t.string :pick_up_time, null: false
      t.integer :state
      t.references :user, foreign_key: true
      t.references :store, foreign_key: true
      t.boolean :like
      t.datetime :read_at

      t.timestamps
    end
  end
end
