class Store < ApplicationRecord
  validates_presence_of :name, :tel, message: '*為必填欄位'
  validates_numericality_of :tel, in: 9..10, message: '請填寫正確的電話號碼（數字）'

  belongs_to :user
  has_many :transactions, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :dishes, -> { order(id: :asc) }, dependent: :destroy
  has_many :business_hours, dependent: :destroy
  has_and_belongs_to_many :store_tags, dependent: :destroy

  mount_uploader :main_img, MainImgUploader

  acts_as_paranoid

  # def self.get_all_store_latlng
  #   self.all.map do |store|
  #     store.to_json
  #   end
  # end
end
