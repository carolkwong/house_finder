class PaymentPolicy < ApplicationPolicy

    class Scope < Scope
      def resolve
          scope.all
      end
    end

    def new?
        user_is_owner_or_admin?
    end


    private
        def user_is_owner_or_admin?
          record.user == user || (user && user.admin)
        end

end
