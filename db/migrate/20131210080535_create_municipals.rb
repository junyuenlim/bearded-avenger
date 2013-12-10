class CreateMunicipals < ActiveRecord::Migration
  def change
    create_table :municipals do |t|
      t.string :name
      t.string :acronym

      t.timestamps
    end
  end
end
