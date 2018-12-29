class CreateOperationtimes < ActiveRecord::Migration[5.0]
  def change
    create_table :operationtimes do |t|
      t.references :restaurant
      t.string :day
      t.datetime :open_time
      t.datetime :close_time
      t.boolean :is_closed
      t.boolean :is_holiday
      t.string :special_message
      t.timestamps
    end
  end
end
