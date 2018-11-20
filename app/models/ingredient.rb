# == Schema Information
#
# Table name: ingredients
#
#  id                :integer          not null, primary key
#  recipe_id         :integer          not null
#  sort_order        :integer          not null
#  name              :string(255)      not null
#  quantity_and_unit :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_ingredients_on_recipe_id  (recipe_id)
#

class Ingredient < ApplicationRecord
  belongs_to :recipe
  has_one :food

  class << self
    def convert_gram(ingredient)
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
      gram
    end
  end
end
