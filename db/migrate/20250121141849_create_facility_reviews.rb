class CreateFacilityReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :facility_reviews do |t|
      t.integer :user_id
      t.integer :facility_post_id
      t.string :evaluation
      t.text :comment

      t.timestamps
    end
  end
end
