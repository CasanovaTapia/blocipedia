class CollaborationsPolicy < ApplicationPolicy
  def create?
    (record.user == user) && user.role?(:premium)
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
