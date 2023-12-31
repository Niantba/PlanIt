class TripPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # Define aquí cómo se deben filtrar y mostrar los registros de viajes
      # Por ejemplo, si todos los usuarios pueden ver todos los viajes:
      scope.all
    end
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def show?
    true
  end

  def index?
    true
  end

  def destroy?
    true
  end

  def update?
    true
  end
end
