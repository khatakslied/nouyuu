class CropPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def toggle_favorite?
    return true
  end

  def favorite?
    return true
  end
end
