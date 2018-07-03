class RemoveIntroductionFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :introduction, :text
  end
end
