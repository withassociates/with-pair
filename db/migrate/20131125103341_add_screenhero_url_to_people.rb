class AddScreenheroUrlToPeople < ActiveRecord::Migration
  def change
    add_column :people, :screenhero_url, :string
  end
end
