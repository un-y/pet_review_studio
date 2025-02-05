class CreateItemReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :item_reviews do |t|
      t.integer :user_id
      t.integer :item_post_id
      t.string :evaluation
      t.text :comment

      t.timestamps
    end
  end
end
