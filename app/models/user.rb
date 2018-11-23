class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  mount_uploader :image, ImageUploader
  has_many :posts
  has_many :posts, source: :user
  # has_many :comments
  # has_many :comments, source: :user
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, uniqueness: true, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_save { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
