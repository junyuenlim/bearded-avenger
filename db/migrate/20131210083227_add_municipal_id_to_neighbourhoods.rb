class AddMunicipalIdToNeighbourhoods < ActiveRecord::Migration
  def change
    add_column :neighbourhoods, :municipal_id, :integer
    add_index :neighbourhoods, :municipal_id
  end
end
