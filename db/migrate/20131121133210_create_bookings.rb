class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :session
      t.string :name, null: false
      t.string :skype, null: true
      t.string :email, null: false
      t.text :project, null: false
      t.timestamps
    end
  end
end
