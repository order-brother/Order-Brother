class CreateJoinTableForDishTagsAndDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dish_tags_dishes, id: false do |t|
      t.belongs_to :dish, index: true
      t.belongs_to :dish_tag, index: true
    end
  end
end
