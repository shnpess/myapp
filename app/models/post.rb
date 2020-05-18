class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :content, presence: true
  validates :name, :kind, :character, :age, length: { maximum: 15 } 
  validates :content, length: { maximum: 100 }   
  belongs_to :user
  has_many :comments
end
