class AddSlugToMunicipals < ActiveRecord::Migration
  def change
    add_column :municipals, :slug, :string
    add_index :municipals, :slug
  end
end
