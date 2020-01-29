class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introduction, :text
    add_column :users, :nickname, :string
    add_column :users, :image, :text
    add_column :users, :position, :string
    add_column :users, :company, :text
    add_column :users, :twitter, :string
    add_column :users, :facebook, :string
    add_column :users, :note, :string
  end
end

