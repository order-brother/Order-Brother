# frozen_string_literal: true
class AddStoreIdInBusinessHours < ActiveRecord::Migration[5.2]
  def change
    add_reference :business_hours, :store, foreign_key: true
  end
end
