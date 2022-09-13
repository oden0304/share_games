class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :post_image
  
  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Post.where(['text LIKE ?', "%#{search}%"])
    else
      Post.all #全て表示。
    end
  end
end
