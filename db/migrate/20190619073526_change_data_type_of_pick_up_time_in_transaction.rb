class ChangeDataTypeOfPickUpTimeInTransaction < ActiveRecord::Migration[5.2]
  def up
    remove_column :transactions, :pick_up_time, :string
    add_column :transactions, :pick_up_time, :datetime
  end

  def down
    remove_column :transactions, :pick_up_time, :datetime
    add_column :transactions, :pick_up_time, :string
  end
end
