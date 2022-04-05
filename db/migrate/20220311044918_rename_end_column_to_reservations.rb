class RenameEndColumnToReservations < ActiveRecord::Migration[5.2]
  def change
    rename_column :reservations, :end, :end_date
    rename_column :reservations, :start, :start_date
  end
end
