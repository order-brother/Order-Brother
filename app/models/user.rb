class User < ApplicationRecord
  has_many :favorite_stores
  has_many :stores, through: :favorite_stores
end
