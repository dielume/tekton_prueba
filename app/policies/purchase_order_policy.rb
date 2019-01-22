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

  def update?
    p_rule?
  end

  def edit?
    p_rule?
  end

  def destroy?
    p_rule?
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
