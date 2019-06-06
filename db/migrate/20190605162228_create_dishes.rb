class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :name
      t.decimal :price
      t.integer :prepare_time
      t.integer :state
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
