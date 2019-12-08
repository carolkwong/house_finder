class ApartmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def new?
      true
    end

    def create?
      return true
    end

    def show?
      true
    end

    def edit?
      user_is_owner_or_admin?
    end

    def update?
      user_is_owner_or_admin?
    end

    def destroy?
       user_is_owner_or_admin?
    e nd


    private
      def user_is_owner_or_admin?
      record.user == user || user.admin
      end

end
