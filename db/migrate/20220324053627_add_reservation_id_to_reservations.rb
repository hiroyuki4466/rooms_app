class AddReservationIdToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :reservation_id, :integer
  end
end
