class ChatRoomPolicy < ApplicationPolicy

  def p_rule?
    user.admin? || user == record.user
  end

  def index?
    p_rule?
  end

  def show?
    p_rule?
  end



  class Scope < Scope
    def resolve
      scope
    end
  end
end
