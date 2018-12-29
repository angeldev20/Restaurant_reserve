class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :firstname
      t.string :lastname
      t.string :phone_number
      t.string :address
      t.string :zipcode
      t.timestamps
    end
  end
end
