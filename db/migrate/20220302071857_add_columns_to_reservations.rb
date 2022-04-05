class AddColumnsToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :total_days, :string
    add_column :reservations, :total_price, :integer
    add_column :reservations, :room_id, :integer
    add_column :reservations, :user_id, :integer
  end
end
