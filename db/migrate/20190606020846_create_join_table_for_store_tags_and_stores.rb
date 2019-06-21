# frozen_string_literal: true
class CreateJoinTableForStoreTagsAndStores < ActiveRecord::Migration[5.2]
  def change
    create_table :store_tags_stores, id: false do |t|
      t.belongs_to :store, index: true
      t.belongs_to :store_tag, index: true
    end
  end
end
