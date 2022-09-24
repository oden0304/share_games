class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags, dependent: :destroy
  has_one_attached :post_image
  
  validates :text, presence: true
  
  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
end
