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
                                 { message: html_text(message, user_email),
                                   user_email: user_email
                                 }
  end

  private

  def html_text(message, user_email)

    "<p class='card-text'>
    <span>#{message.created_at.strftime("%H:%M %d/%m/%Y")}</span>
    <strong>#{user_email}: </strong>
    <span>#{message.body}</span>
    </p>"
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
