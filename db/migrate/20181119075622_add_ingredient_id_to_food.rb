class AddIngredientIdToFood < ActiveRecord::Migration[5.1]
  def change
    add_reference :foods, :ingredient, index: true
  end
end
