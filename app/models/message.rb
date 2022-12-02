class Message < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  belongs_to :room
  
  def template
    ApplicationController.renderer.render partial: 'messages/message', locals: { message: self }
  end
end
