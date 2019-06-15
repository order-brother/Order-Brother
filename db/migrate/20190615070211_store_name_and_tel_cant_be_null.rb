# frozen_string_literal: true
class StoreNameAndTelCantBeNull < ActiveRecord::Migration[5.2]
  def self.up
      change_column :stores, :name, :string, null: false, default: '', limit: 20, unique: true
      change_column :stores, :tel, :string, null: false, default: '', limit: 10, unique: true
  end

  def self.down
      change_column :stores, :name, :string
      change_column :stores, :tel, :string
  end
end
