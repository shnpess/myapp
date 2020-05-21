class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :content, presence: true
  validates :name, :kind, :character, :age, length: { maximum: 15 } 
  validates :content, length: { maximum: 100 }   
  belongs_to :user
  has_many :comments
  has_many :groups
  def self.search(search)
    return Post.all unless search
    Post.joins(:user).where(['gender LIKE ? OR content LIKE ? OR name LIKE ? OR age LIKE ? OR vaccination LIKE ? OR addres LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
   
  end


end
