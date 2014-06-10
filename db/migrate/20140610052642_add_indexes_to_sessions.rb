class AddIndexesToSessions < ActiveRecord::Migration
  def change
    add_index :sessions, :starts_at
    add_index :sessions, :ends_at
    add_index :sessions, :person_id
    add_index :sessions, [:person_id, :starts_at, :ends_at]
  end
end
