class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:name]

  validates :name, presence: true, length: { maximum: 15 }

  # 新規登録時の利用規約チェックボックスのバリデーション
  validates_acceptance_of :agreement, allow_nil: false, on: :create

  has_one_attached :profile_image

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  # フォローをした、されたの関係
  has_many :relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
  # 通知
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  
  # リポスト
  has_many :reposts, dependent: :destroy

  # フォロー通知
  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(['name = :value', { value: name }]).first
    else
      where(conditions).first
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  # フォローしたときの処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  # フォローを外すときの処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end
  
  def followed_by?(user)
    relationships.find_by(followed_id: user.id).present?
  end

  # ゲストログイン
  def self.guest
    find_or_create_by!(name: 'guestuser') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'guestuser'
      user.agreement = true
    end
  end

  def get_profile_image
    profile_image.attached? ? profile_image : 'no_image.png'
  end
  
  # リポスト済みか判定
  def reposted?(post_id)
    self.reposts.where(post_id: post_id).exists?
  end
  
  # ユーザ自身の投稿及びリポストした投稿を取得するメソッド
  def posts_with_reposts
  relation = Post.joins("LEFT OUTER JOIN reposts ON posts.id = reposts.post_id AND reposts.user_id = #{self.id}")
                   .select("posts.*, reposts.user_id AS repost_user_id, (SELECT name FROM users WHERE id = repost_user_id) AS repost_user_name")
    relation.where(user_id: self.id)
            .or(relation.where("reposts.user_id = ?", self.id))
            .with_attached_post_image
            .preload(:user, :comments, :favorites, :reposts)
            .order(Arel.sql("CASE WHEN reposts.created_at IS NULL THEN posts.created_at ELSE reposts.created_at END"))
  end
  
  # リポストを含んだタイムライン
  def followings_posts_with_reposts
    relation = Post.joins("LEFT OUTER JOIN reposts ON posts.id = reposts.post_id AND (reposts.user_id = #{self.id} OR reposts.user_id IN (SELECT follow_id FROM relationships WHERE user_id = #{self.id}))")
                   .select("posts.*, reposts.user_id AS repost_user_id, (SELECT name FROM users WHERE id = repost_user_id) AS repost_user_name")
    relation.where(user_id: self.followings_with_userself.pluck(:id))
            .or(relation.where(id: Repost.where(user_id: self.followings_with_userself.pluck(:id)).distinct.pluck(:post_id)))
            .where("NOT EXISTS(SELECT 1 FROM reposts sub WHERE reposts.post_id = sub.post_id AND reposts.created_at < sub.created_at)")
            .with_attached_images
            .preload(:user, :review, :comments, :likes, :reposts)
            .order(Arel.sql("CASE WHEN reposts.created_at IS NULL THEN posts.created_at ELSE reposts.created_at END"))
  end
  
  # 
  def followings_with_userself
    User.where(id: self.followings.pluck(:id)).or(User.where(id: self.id))
  end
end
