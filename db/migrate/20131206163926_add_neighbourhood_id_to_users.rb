class AddNeighbourhoodIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :neighbourhood_id, :integer
    add_index :users, :neighbourhood_id
  end
end
