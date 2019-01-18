class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :purchase_order
  before_create :set_default_role

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
    self.role == "client"
  end

end
