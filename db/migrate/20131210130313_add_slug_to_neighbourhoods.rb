class AddSlugToNeighbourhoods < ActiveRecord::Migration
  def change
    add_column :neighbourhoods, :slug, :string
    add_index :neighbourhoods, :slug
  end
end
