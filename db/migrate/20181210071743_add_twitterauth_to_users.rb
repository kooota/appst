class AddTwitterauthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :description, :text
    add_column :users, :uid, :integer
    add_column :users, :provider, :text
    add_column :users, :location, :text
  end
end
