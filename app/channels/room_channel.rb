class RoomChannel < ApplicationCable::Channel
  def subscribed
    @user = User.find_by(id: params[:user_id])
    reject if @user.nil?
    @room = @user.rooms.find_by(id: params[:room_id])
    reject if @room.nil?
    stream_for(@room)  
  end

  def unsubscribed
  end
end
