class Quantity < ApplicationRecord
  belongs_to :food
  enum quantity: { gram: 1, pack: 2, little: 3, oosaji: 4, kosaji: 5}
end
