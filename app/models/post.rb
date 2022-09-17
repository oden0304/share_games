class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :post_image
  
  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.search(search, type) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、textカラムを部分一致検索
      if type ==="投稿"
        Post.where(['text LIKE ?', "%#{search}%"])
      elsif type === "ユーザー"
        user = User.where(['name LIKE ?', "%#{search}%"]).first
        if user
          Post.where(['user_id LIKE ?', user.id])
        else 
          Post.all
        end
      end
    else
      Post.all #全て表示。
    end
  end
end
