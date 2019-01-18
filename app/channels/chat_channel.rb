class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    current_user.chat_rooms.each do |chat_room|
      stream_from "chat_room:#{chat_room.id}"
    end
    # stream_from "chat_channel:#{current_user.chat_rooms.first.id}"
  end

  def unsubscribed
    stop_all_streams
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    current_user.messages.create(body: data['message'])
  end
end
