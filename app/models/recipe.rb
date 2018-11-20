# == Schema Information
#
# Table name: recipes
#
#  id            :integer          not null, primary key
#  title         :string(255)      not null
#  video_url     :string(255)      not null
#  thumbnail_url :string(255)      not null
#  servings      :string(255)      not null
#  salt          :float(24)
#  calorie       :float(24)
#  introduction  :text(65535)
#  boosted       :boolean          default("0"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_recipes_on_boosted  (boosted)
#

class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :instructions, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  accepts_nested_attributes_for :instructions, allow_destroy: true

  def calculate_total_calories
    calories = []
    ingredients.each do |ingredient|
      gram = Ingredient.convert_gram(ingredient)
      calorie = ingredient.food.return_calories(gram)
      calories << calorie
    end
    total_calories = calories.sum
    total_calories
  end

  def calculate_total_salts
    salts = []
    ingredients.each do |ingredient|
      gram = Ingredient.convert_gram(ingredient)
      salt = ingredient.food.return_salts(gram)
      salts << salt
    end
    total_salts = salts.sum
    total_salts
  end

end
