# frozen_string_literal: true
class AddIndexOfPhoneInUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :phone, unique: true
  end
end
