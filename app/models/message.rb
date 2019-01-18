class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  validates :body, presence: true

  # after_create_commit :broadcast_create_order


  def broadcast_create_order
    @message = message.find(self.id)
    ActionCable.server.broadcast "web_notifications_channel",
                                 message: "holi"
  end

end
