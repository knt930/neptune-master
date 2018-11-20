class Food < ApplicationRecord
  has_many :quantity
  has_one :ingredient
end
