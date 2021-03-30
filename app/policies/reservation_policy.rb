class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def new?
    true
  end
  def show?
    true
  end
  def create?
    true
  end
  def update?
    true
  end
  def destroy?
    record.user_id == user.id
  end
end
