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

  def new?
    user.present?
  end

  def create?
    true
  end


end
