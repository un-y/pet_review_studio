class CreateItemPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :item_posts do |t|
      t.integer :user_id
      t.integer :item_genre_id
      t.integer :pet_genre_id
      t.string :name
      t.text :introduction
      t.integer :prices

      t.timestamps
    end
  end
end
