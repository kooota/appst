class CreateRelateds < ActiveRecord::Migration[5.2]
  def change
    create_table :relateds do |t|
      t.text :related_link
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
