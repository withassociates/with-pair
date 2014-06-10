class AddIndexesToBookings < ActiveRecord::Migration
  def change
    add_index :bookings, :session_id
    add_index :bookings, [:session_id, :cancelled_at]
  end
end
