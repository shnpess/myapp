class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def self.search(search)
    return Post.all unless search
    Post.joins(:user).where(['gender LIKE ? OR content LIKE ? OR kind Like ? OR name LIKE ? OR age LIKE ? OR vaccination LIKE ? OR addres LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
   
  end

end
