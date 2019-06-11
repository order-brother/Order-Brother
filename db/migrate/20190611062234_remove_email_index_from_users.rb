# frozen_string_literal: true
class RemoveEmailIndexFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_index 'email', name: 'index_users_on_email'
  end
end
