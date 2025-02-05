class FacilityGenre < ApplicationRecord
  has_many :facility_posts, dependent: :destroy
end
