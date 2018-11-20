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
      if ingredient.quantity_and_unit.include?('g')
        gram = ingredient.food.quantity.gram.first.gram.to_f * ingredient.quantity_and_unit.to_f
      elsif ingredient.quantity_and_unit.include?('パック')
        gram = ingredient.food.quantity.pack.first.gram.to_f * ingredient.quantity_and_unit.to_f
      elsif ingredient.quantity_and_unit.include?('少々')
        gram = ingredient.food.quantity.little.first.gram.to_f
      elsif ingredient.quantity_and_unit.include?('大さじ')
        if ingredient.quantity_and_unit.include?('1/2')
          gram = ingredient.food.quantity.oosaji.first.gram.to_f * 0.5
        else
          gram = ingredient.food.quantity.oosaji.first.gram.to_f * ingredient.quantity_and_unit.gsub(/[^\d]/, "").to_f
        end
      elsif ingredient.quantity_and_unit.include?('小さじ')
        if ingredient.quantity_and_unit.include?('1/2')
          gram = ingredient.food.quantity.kosaji.first.gram.to_f * 0.5
        else
          gram = ingredient.food.quantity.kosaji.first.gram * ingredient.quantity_and_unit.gsub(/[^\d]/, "").to_f
        end
      end
      calorie = ingredient.food.calories_per_100.to_f * (gram / 100)
      calories << calorie
    end
    total_calories = calories.sum
    total_calories
  end

  def calculate_total_salts
    salts = []
    ingredients.each do |ingredient|
      if ingredient.quantity_and_unit.include?('g')
        gram = ingredient.food.quantity.gram.first.gram.to_f * ingredient.quantity_and_unit.to_f
      elsif ingredient.quantity_and_unit.include?('パック')
        gram = ingredient.food.quantity.pack.first.gram.to_f * ingredient.quantity_and_unit.to_f
      elsif ingredient.quantity_and_unit.include?('少々')
        gram = ingredient.food.quantity.little.first.gram.to_f
      elsif ingredient.quantity_and_unit.include?('大さじ')
        if ingredient.quantity_and_unit.include?('1/2')
          gram = ingredient.food.quantity.oosaji.first.gram.to_f * 0.5
        else
          gram = ingredient.food.quantity.oosaji.first.gram.to_f * ingredient.quantity_and_unit.gsub(/[^\d]/, "").to_f
        end
      elsif ingredient.quantity_and_unit.include?('小さじ')
        if ingredient.quantity_and_unit.include?('1/2')
          gram = ingredient.food.quantity.kosaji.first.gram.to_f * 0.5
        else
          gram = ingredient.food.quantity.kosaji.first.gram * ingredient.quantity_and_unit.gsub(/[^\d]/, "").to_f
        end
      end
      salt = ingredient.food.salts_per_100.to_f * (gram / 100)
      salts << salt
    end
    total_salts = salts.sum
    total_salts
  end

end
