class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.integer :project_id
      t.string :title
      t.string :start
      t.string :current
      t.string :goal
      t.boolean :success

      t.timestamps
    end
  end
end
