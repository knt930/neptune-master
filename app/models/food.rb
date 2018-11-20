class Food < ApplicationRecord
  has_many :quantity
  has_one :ingredient

  def return_calories(gram)
    calorie = calories_per_100.to_f * (gram / 100)
    calorie
  end

  def return_salts(gram)
    salt = salts_per_100.to_f * (gram / 100)
    salt
  end

end
