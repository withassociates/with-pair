class AddCancelledAtToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :cancelled_at, :datetime
    add_index :bookings, :cancelled_at
  end
end
