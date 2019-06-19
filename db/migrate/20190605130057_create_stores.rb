# frozen_string_literal: true
class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :latitude
      t.string :tel
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
