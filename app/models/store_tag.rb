class StoreTag < ApplicationRecord
  has_and_belongs_to_many :stores
end
