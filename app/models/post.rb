class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :content, :name, presence: true
  validates :name, length: { maximum: 8 }
  validates :content, length: { maximum: 100 }
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :category_posts, dependent: :destroy
  has_many :categories, through: :category_posts
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
end
