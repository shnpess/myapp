class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :email, uniqueness: true
  validates :nickname, :email, presence: true
  validates :nickname, length: { maximum: 6 } 
  validates :profile, length: { maximum: 70 } 
  has_many :posts
  has_many :comments  
  has_many :group_users
  has_many :groups, through: :group_users
  mount_uploader :picture, ImageUploader
end
