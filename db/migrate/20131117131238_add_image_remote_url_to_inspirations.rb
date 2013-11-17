class AddImageRemoteUrlToInspirations < ActiveRecord::Migration
  def change
    add_column :inspirations, :image_remote_url, :string
  end
end
