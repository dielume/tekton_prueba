class MessagesController < ApplicationController
  before_action :set_chat_room

  def create
    message = @chat_room.messages.new(message_params)
    message.user = current_user
    message.save
    redirect_to @chat_room
  end

  private

  def set_chat_room
    @chat_room = ChatRoom.find(params[:chat_room_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end

end
