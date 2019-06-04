class Store < ApplicationRecord
  has_many :favorite_stores
  has_many :users, through: :favorite_stores
end
