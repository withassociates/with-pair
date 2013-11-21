class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :person
      t.datetime :starts_at
      t.datetime :ends_at
      t.timestamps
    end
  end
end
