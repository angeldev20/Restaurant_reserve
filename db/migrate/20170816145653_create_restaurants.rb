class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :description
      t.string :zipcode
      t.decimal :latitude, {precision:10, scale:6}
      t.decimal :longitude, {precision:10, scale:6}
      t.integer :max_people
      t.datetime :open_time
      t.datetime :close_time
      t.string :phone_number
      t.string :website_link
      t.integer :max_table
      t.string :cost_range_min
      t.string :cost_range_max
      t.string :location

      t.timestamps
    end
  end
end
