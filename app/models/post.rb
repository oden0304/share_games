class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_one_attached :post_image
  
  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end
