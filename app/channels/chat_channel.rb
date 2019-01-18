class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel_#{current_user.chat_rooms.first.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    current_user.messages.create(body: data['message'])
  end
end
