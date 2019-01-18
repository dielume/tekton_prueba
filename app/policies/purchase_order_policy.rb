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
      scope
    end
  end
end
