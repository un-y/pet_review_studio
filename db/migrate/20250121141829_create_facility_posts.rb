class CreateFacilityPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :facility_posts do |t|
      t.integer :user_id
      t.integer :facility_genre_id
      t.integer :pet_genre_id
      t.string :name
      t.string :address
      t.time :opening_time
      t.time :closing_time
      t.text :prices
      t.text :introduction

      t.timestamps
    end
  end
end
