# frozen_string_literal: true
class ChangePrepareTimeToBeIntegerInDishes < ActiveRecord::Migration[5.2]
  def self.up
    change_column :dishes, :prepare_time, :integer
  end

  def self.down
    change_column :dishes, :prepare_time, :time
  end
end
