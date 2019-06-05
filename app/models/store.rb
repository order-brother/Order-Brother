class Store < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :dishes, dependent: :destroy
  has_many :business_hours, dependent: :destroy
  has_and_belongs_to_many :store_tag
end
