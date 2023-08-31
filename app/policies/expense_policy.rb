class ExpensePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    # scope.all
    # end
  end

  def index?
    true
  end
end