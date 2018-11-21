class Post < ApplicationRecord
  belongs_to :user, :optional => true
  mount_uploader :image, ImageUploader
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
