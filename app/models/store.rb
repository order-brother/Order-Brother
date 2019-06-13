class Store < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :dishes, dependent: :destroy
  has_many :business_hours, dependent: :destroy
  has_and_belongs_to_many :store_tags

  mount_uploader :main_img, MainImgUploader
  
  
  # def self.get_all_store_latlng
  #   self.all.map do |store|
  #     store.to_json
  #   end
  # end
end
