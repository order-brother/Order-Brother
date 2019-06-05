class Dish < ApplicationRecord
  belongs_to :store
  has_and_belongs_to_many :dish_tags
end
