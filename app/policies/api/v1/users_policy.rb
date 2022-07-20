class Api::V1::UsersPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
