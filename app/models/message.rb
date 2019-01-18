class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  validates :body, presence: true

  after_create_commit :broadcast_create_order


  def broadcast_create_order
    @message = message.find(self.id)
    ActionCable.server.broadcast "chat_rooms:#{@message.chat_room.id}",
                                {message: MessagesController.render(@message.body),
                                 chatroom_id: @message.chat_room.id}

  end

end
