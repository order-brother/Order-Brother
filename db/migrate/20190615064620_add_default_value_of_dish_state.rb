# frozen_string_literal: true
class AddDefaultValueOfDishState < ActiveRecord::Migration[5.2]
  def change
    change_column_default :dishes, :state, from: nil, to: 1
  end
end
