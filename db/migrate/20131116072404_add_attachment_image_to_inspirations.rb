class AddAttachmentImageToInspirations < ActiveRecord::Migration
  def self.up
    change_table :inspirations do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :inspirations, :image
  end
end
