class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.references :restaurant
      t.string :food_category
      t.string :restaurant_type
      t.string :environment
      t.string :special_deal
      t.timestamps
    end
  end
end
