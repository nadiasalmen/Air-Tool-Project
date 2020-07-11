class AddColumnToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :price, :float
  end
end
