class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :text, presence: true
  validates :text, length: { maximum: 50 }
end
