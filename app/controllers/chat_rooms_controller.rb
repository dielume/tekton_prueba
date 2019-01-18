class ChatRoomsController < ApplicationController
  before_action :set_chat_room, only: [:show]

  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    @messages = @chat_room.messages.take(50)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat_room
      @chat_room = ChatRoom.find(params[:id])
    end
end
