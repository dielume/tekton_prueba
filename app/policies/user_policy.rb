class UserPolicy < ApplicationPolicy

  def rule?
    user.admin? || user == record
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
      unless user.admin? 
        scope.where(id: user.id)
      else
        scope
      end
    end
  end

end
