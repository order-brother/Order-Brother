class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :tel
      t.string :business_hour

      t.timestamps
    end
  end
end
