class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :email, uniqueness: true
  validates :nickname, :email, presence: true
  validates :nickname, length: { maximum: 6 }
  validates :profile, length: { maximum: 70 }
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  mount_uploader :picture, ImageUploader

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end
