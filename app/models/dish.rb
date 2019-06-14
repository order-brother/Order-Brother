class Dish < ApplicationRecord
  belongs_to :store
  has_many :transaction_items
  has_and_belongs_to_many :dish_tags

  mount_uploader :main_img, MainImageUploader
end
