class RemoveScreenheroUrlFromPeople < ActiveRecord::Migration
  def change
    remove_column :people, :screenhero_url, :string
  end
end
