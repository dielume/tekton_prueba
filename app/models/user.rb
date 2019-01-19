class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :purchase_orders, :dependent => :destroy
  has_many :chat_rooms, :dependent => :destroy
  has_many :messages, :dependent => :destroy

  before_create :set_default_role
  after_create :create_chat_room

  def admin?
    role == "admin"
  end

  def client?
    role == "client"
  end

  def to_s
    email
  end

  private

  def set_default_role
    self.role = "client"
  end

  def create_chat_room
    chat = ChatRoom.new
    chat.user = self
    chat.title = "room_#{self.email}"
    chat.save!
  end

end
