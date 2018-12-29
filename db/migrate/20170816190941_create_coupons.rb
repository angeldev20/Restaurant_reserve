class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
    	t.references :restaurant
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :start_time
      t.datetime :end_time
      t.integer :value
      t.string :coupon_detail
      t.boolean :two_week_coupon
      t.boolean :month_coupon
      t.timestamps
    end
  end
end
