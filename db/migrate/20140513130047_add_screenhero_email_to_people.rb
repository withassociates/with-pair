class AddScreenheroEmailToPeople < ActiveRecord::Migration
  def change
    add_column :people, :screenhero_email, :string
  end
end
