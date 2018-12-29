class AddBlurbToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :blurb, :string
  end
end
