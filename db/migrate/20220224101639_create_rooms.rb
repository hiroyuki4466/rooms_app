class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :room_id
      t.string :room_name
      t.string :introduction
      t.integer :price
      t.string :address
      t.string :room_image

      t.timestamps
    end
  end
end
