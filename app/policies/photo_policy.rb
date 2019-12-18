class PhotoPolicy < ApplicationPolicy
  	class Scope < Scope
    	def resolve
      		scope.all
    	end
  	end

    def destroy?
        user_is_owner_or_admin?
    end


    private
        def user_is_owner_or_admin?
      		record.apartment.user == user || user.admin
      	end

end
