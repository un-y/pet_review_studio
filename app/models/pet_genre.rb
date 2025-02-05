class PetGenre < ApplicationRecord
  has_many :users, dependent: :destroy
  has_and_belongs_to_many :item_posts
  has_many :facility_posts, dependent: :destroy
end
