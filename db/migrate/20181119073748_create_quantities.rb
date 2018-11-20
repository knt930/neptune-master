class CreateQuantities < ActiveRecord::Migration[5.1]
  def change
    create_table :quantities do |t|
      t.integer :quantity
      t.string :gram
      t.references :food, index: true

      t.timestamps
    end
  end
end
