# frozen_string_literal: true
class AddMainImgToDish < ActiveRecord::Migration[5.2]
  def change
    add_column :dishes, :main_img, :string
  end
end
