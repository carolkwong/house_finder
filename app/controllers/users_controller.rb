class UsersController < ApplicationController

	before_action :set_user, only: [:show, :edit_profile, :update_profile, :edit_avatar, :update_avatar]

	def show
	end

	def edit_profile
	end

	def update_profile
		# TODO : udpate user profile according to the form input
	end

	def edit_avatar
	end

	def update_avatar
		# TODO : update user avatar according to user input
	end

	private

	def set_user
    	@user = User.find(params[:id])
    	authorize @user # jason has put authorize in here since it is repeated in all user actions
	end

	def profile_params
		params.require(:user).permit(:phone, :first_name, :last_name, :date_of_birth, :gender)
	end

	def avatar_params
	   params.require(:user).permit(:avatar)
	end
end
