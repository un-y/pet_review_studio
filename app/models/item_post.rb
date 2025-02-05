class ItemPost < ApplicationRecord
  belongs_to :user
  belongs_to :item_genre
  has_and_belongs_to_many :pet_genres
  has_many :item_reviews, dependent: :destroy
end
