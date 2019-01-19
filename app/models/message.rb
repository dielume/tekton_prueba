class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  validates :body, presence: true

  after_create_commit :broadcast_create_message


  def broadcast_create_message
    message = Message.find(self.id)
    chat_room_id = message.chat_room.id
    user_email = get_user_email(message)

    ActionCable.server.broadcast "chat_rooms:#{chat_room_id}",
                                 { message: message.body,
                                   user_email: user_email
                                 }
  end

  private

  def get_user_email(message)
    user = message.user
    if user.admin?
      "Admin"
    else
      user.email
    end

  end

end
