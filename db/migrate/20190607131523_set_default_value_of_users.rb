# frozen_string_literal: true
class SetDefaultValueOfUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :name, :string, null: false, default: "", limit: 20, unique: true
    change_column :users, :phone, :string, null: false, default: "", limit: 15, unique: true
  end

  def down
    change_column :users, :name, :string
    change_column :users, :phone, :string
  end
end
