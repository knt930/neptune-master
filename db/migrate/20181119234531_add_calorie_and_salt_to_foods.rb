class AddCalorieAndSaltToFoods < ActiveRecord::Migration[5.1]
  def change
    add_column :foods, :calories_per_100, :string
    add_column :foods, :salts_per_100, :string
  end
end
