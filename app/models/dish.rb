class Dish < ApplicationRecord
  validates_presence_of :name, message: '名稱必填'
  validates_length_of :name, maximum: 30, message: '最長 30 個字'
  
  belongs_to :store
  has_many :transaction_items, dependent: :destroy
  has_and_belongs_to_many :dish_tags, dependent: :destroy

  mount_uploader :main_img, MainImgUploader

  acts_as_paranoid
end