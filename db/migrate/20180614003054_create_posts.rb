class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.string :title
      t.string :subtitle
      t.text :content
      t.text :service_url
      t.text :appstore_url
      t.text :googleplay_url
      t.integer :user_id
      t.integer :category_id
      t.integer :likes_count
      t.string :twitter
      t.string :facebook

      t.timestamps null: false
    end
  end
end
