class RemoveTwitterouahFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :name, :string
    remove_column :users, :descriotion, :text
    remove_column :users, :uid, :integer
    remove_column :users, :provider, :text
    remove_column :users, :locaiton, :text
  end
end
