class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :content, :name, presence: true
  validates :name, length: { maximum: 8 }  
  validates :content, length: { maximum: 100 }   
  belongs_to :user
  has_many :comments
  has_many :groups
  has_many :category_posts
  has_many :categories, through: :category_posts
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
end
