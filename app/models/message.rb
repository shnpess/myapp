class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates :content, presence: true, unless: :image?
  validates :content, length: { maximum: 50 }
  mount_uploader :image, ImageUploader
end
