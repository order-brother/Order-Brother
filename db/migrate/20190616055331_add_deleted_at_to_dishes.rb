# frozen_string_literal: true
class AddDeletedAtToDishes < ActiveRecord::Migration[5.2]
  def change
    add_column :dishes, :deleted_at, :datetime
    add_index :dishes, :deleted_at
  end
end
