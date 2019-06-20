# frozen_string_literal: true
class AddMainImgToStore < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :main_img, :string
  end
end
