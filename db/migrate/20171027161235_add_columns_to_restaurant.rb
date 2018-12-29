class AddColumnsToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :breakfast_start, :datetime
    add_column :restaurants, :breakfast_end, :datetime
    add_column :restaurants, :lunch_start, :datetime
    add_column :restaurants, :lunch_end, :datetime
    add_column :restaurants, :dinner_start, :datetime
    add_column :restaurants, :dinner_end, :datetime
    add_column :restaurants, :parking_valet, :boolean
    add_column :restaurants, :outdoor_seating, :boolean
    add_column :restaurants, :pet_friendly, :boolean
    add_column :restaurants, :handicap_accessible, :boolean
    add_column :restaurants, :smoking_allowed, :boolean
    add_column :restaurants, :cocktails, :boolean
    add_column :restaurants, :private_parties, :boolean
    add_column :restaurants, :big_groups, :boolean
  end
end
