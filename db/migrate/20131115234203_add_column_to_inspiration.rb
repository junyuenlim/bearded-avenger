class AddColumnToInspiration < ActiveRecord::Migration
  def change
    add_column :inspirations, :discussion_id, :integer
  end
end
