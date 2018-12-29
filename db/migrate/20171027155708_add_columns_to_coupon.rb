class AddColumnsToCoupon < ActiveRecord::Migration[5.0]
  def change
    add_column :coupons, :monday, :boolean
    add_column :coupons, :tuesday, :boolean
    add_column :coupons, :wednesday, :boolean
    add_column :coupons, :thursday, :boolean
    add_column :coupons, :friday, :boolean
    add_column :coupons, :saturday, :boolean
    add_column :coupons, :sunday, :boolean
  end
end
