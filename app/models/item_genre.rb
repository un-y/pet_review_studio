class ItemGenre < ApplicationRecord
  has_many :item_posts, dependent: :destroy
end
