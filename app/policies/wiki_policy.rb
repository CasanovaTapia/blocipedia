class WikiPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    if record.private?
      record.user.role == 'premium'
    else
      true
    end
  end


  class Scope < Scope
    def resolve
      scope
    end
  end
end
