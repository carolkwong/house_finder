class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
  	user_is_owner_or_admin?
  end

  def edit_profile?
  	user_is_owner_or_admin?
  end

  def update_profile?
  	user_is_owner_or_admin?
  end

  def edit_avatar?
  	user_is_owner_or_admin?
  end

  def update_avatar?
  	user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
  	record == user || user.admin
  end
end
