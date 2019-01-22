class PurchaseOrderPolicy < ApplicationPolicy

  def p_rule?
    user.admin? || user==record.user
  end

  def index?
    p_rule?
  end

  def show?
    p_rule?
  end

  def create?
    p_rule?
  end

  def new?
    p_rule?
  end
  
  def status?
    p_rule?
  end

  def update?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def destroy?
    user.admin?
  end



  class Scope < Scope
    def resolve
      unless user.admin?
        scope.where(user_id: user.id)
      else
        scope
      end
    end
  end

end
