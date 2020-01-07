class BookingPolicy < ApplicationPolicy


  class Scope < Scope
    def resolve
      if user.admin
      scope.all
      else
      scope.joins(:apartment).where('apartments.user_id = ? OR bookings.user_id = ?', user.id, user.id)
      end
    end
  end


    def new?
      true
    end

    def create?
      return true
    end

    def show?
      user_is_owner_or_admin?
    end

    def edit?
      user_is_owner_or_admin?
    end

    def update?
      user_is_owner_or_admin?
    end

    def destroy?
       user_is_owner_or_admin?
    end


    private
      def user_is_owner_or_admin?
      record.user == user || user.admin
      end

end
