class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :name, :age, :weight, :gender, :character, :image, :content, presence: true
  belongs_to :user
end
