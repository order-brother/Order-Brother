# frozen_string_literal: true
class DishNameCantBeNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :dishes, :name, false
  end
end
