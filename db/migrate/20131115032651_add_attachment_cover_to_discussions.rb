class AddAttachmentCoverToDiscussions < ActiveRecord::Migration
  def self.up
    change_table :discussions do |t|
      t.attachment :cover
    end
  end

  def self.down
    drop_attached_file :discussions, :cover
  end
end
