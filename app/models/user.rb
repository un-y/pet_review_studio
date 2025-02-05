class User < ApplicationRecord
  belongs_to :pet_genre, optional: true
  has_many :facility_posts, dependent: :destroy
  has_many :item_posts, dependent: :destroy
  has_many :facility_reviews, dependent: :destroy
  has_many :item_reviews, dependent: :destroy

  has_one_attached :profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :lockable
end
