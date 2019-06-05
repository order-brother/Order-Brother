class StoreTag < ActiveRecord::Migration[5.2]
  def change
    create_table :store_tag do |t|
      t.string :category, null: false, limit: 20, unique: true, index: { unique: true }
      t.timestamps
    end
  end
end
