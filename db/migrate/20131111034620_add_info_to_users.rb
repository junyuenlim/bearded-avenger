class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :first_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :fb_link, :string
    add_column :users, :username, :string
    add_column :users, :timezone, :integer
    add_column :users, :bio, :string
    add_column :users, :birthday, :string
    add_column :users, :currency, :string
    add_column :users, :hometown, :string
    add_column :users, :location, :string
    add_column :users, :fb_verified, :boolean
  end
end
