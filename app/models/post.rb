class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :name, :age, :weight, :gender, :character, :content, presence: true
  validates :name, length: { maximum: 6 } 
  validates :content, length: { maximum: 100 }   
  belongs_to :user
end
