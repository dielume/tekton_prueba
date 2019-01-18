class PointPolicy < ApplicationPolicy

  def rule?
    user.admin? || user.client?
  end

  def index?
    rule?
  end

  def show?
    rule?
  end

  def create?
    rule?
  end

  def new?
    rule?
  end

  def update?
    rule?
  end

  def edit?
    rule?
  end

  def destroy?
    rule?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
