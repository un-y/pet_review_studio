class FacilityPost < ApplicationRecord
  belongs_to :user
  belongs_to :facility_genre
  has_and_belongs_to_many :pet_genres
  has_many :facility_reviews, dependent: :destroy
end
