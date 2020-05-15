class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :name, :age, :weight, :gender, :character, :content, presence: true
  belongs_to :user
end
