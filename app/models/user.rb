class User < ApplicationRecord
  has_many :stores
  has_many :transactions
end
