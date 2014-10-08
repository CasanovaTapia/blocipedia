class WikiPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    unless record.public?
      record.user.role == "premium"
    end
  end

  
  class Scope < Scope
    def resolve
      scope
    end
  end
end
