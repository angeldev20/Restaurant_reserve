class CreateCuisineMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :cuisine_memberships do |t|
      t.integer :restaurant_id
      t.integer :cuisine_id
      t.integer :position

      t.timestamps
    end
  end
end
