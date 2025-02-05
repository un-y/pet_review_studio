class CreatePetGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :pet_genres do |t|
      t.string :name

      t.timestamps
    end
  end
end
