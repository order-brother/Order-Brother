class DishTag < ApplicationRecord
  has_and_belongs_to_many :dishes, dependent: :destroy
end
