class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :followedproject_id
      t.integer :follower_id

      t.timestamps
    end
    add_index :relationships, :followedproject_id
    add_index :relationships, :follower_id
    add_index :relationships, [:followedproject_id, :follower_id], unique: true
  end
end
