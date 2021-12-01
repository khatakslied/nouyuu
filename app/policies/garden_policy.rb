class GardenPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    return true
  end

  def new?
    return true
  end

  def create?
    return true
  end
end
