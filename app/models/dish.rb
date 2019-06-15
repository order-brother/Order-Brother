class Dish < ApplicationRecord
  validates_presence_of :name
  validates_length_of :name, maximum: 30
  
  belongs_to :store
  has_many :transaction_items
  has_and_belongs_to_many :dish_tags, dependent: :destroy

  mount_uploader :main_img, MainImgUploader
end
