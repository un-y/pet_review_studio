class CreateFacilityGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :facility_genres do |t|
      t.string :name

      t.timestamps
    end
  end
end
