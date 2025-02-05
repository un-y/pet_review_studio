class CreateJoinTableFacilityPostsPetGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :facility_posts_pet_genres, id: false do |t|
      t.integer :facility_post_id, null: false
      t.integer :pet_genre_id, null: false
      t.index :facility_post_id
      t.index :pet_genre_id
    end
  end
end