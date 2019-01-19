class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    if current_user.admin?
      chat_rooms = ChatRoom.all
      chat_rooms.each do |chat_room|
        stream_from "chat_rooms:#{chat_room.id}"
      end
    else
      current_user.chat_rooms.each do |chat_room|
        stream_from "chat_rooms:#{chat_room.id}"
      end
    end

    # stream_from "chat_rooms_channel:#{current_user.chat_room}"
  end

  def unsubscribed
    # stop_all_streams
    # Any cleanup needed when channel is unsubscribed
  end

  # def send_message(data)
  #   current_user.messages.create(body: data['message'])
  # end
end
