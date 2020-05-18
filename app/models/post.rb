class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :name, :gender, :content, presence: true
  validates :name, :kind, :character, length: { maximum: 10 } 
  validates :content, length: { maximum: 100 }   
  belongs_to :user
  has_many :comments
end
