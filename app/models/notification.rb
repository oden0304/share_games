class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) } #並び順のデフォルトを作成日時の降順に変更
  belongs_to :post, optional: true #nillを
  belongs_to :comment, optional: true

  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
end
