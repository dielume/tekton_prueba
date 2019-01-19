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
                                 { message: html_text(message.body, user_email),
                                   user_email: user_email
                                 }
  end

  private

  def html_text(message_body, user_email)
    "<div class='div col-12'><strong>#{user_email}: </strong><span>#{message_body}</span></div>"
  end

  def get_user_email(message)
    user = message.user
    if user.admin?
      "Admin"
    else
      user.email
    end

  end

end
