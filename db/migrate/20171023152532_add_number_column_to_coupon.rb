class AddNumberColumnToCoupon < ActiveRecord::Migration[5.0]
  def change
    add_column :coupons, :number, :integer
  end
end
