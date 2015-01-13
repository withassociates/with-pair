class RemoveWinnieFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :winnie, :string
  end
end
