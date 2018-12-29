class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.integer :restaurant_id
      t.string :image

      t.timestamps
    end
  end
end
