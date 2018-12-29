class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
    	t.references :user
    	t.references :restaurant
      t.datetime :time
      t.datetime :date
      t.integer :head_count
      t.string :special_request
      t.boolean :cancel
      t.timestamps
    end
  end
end
