class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  include Pundit

    after_action :verify_authorized, except: :index, unless: :skip_pundit?
    after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def configure_permitted_parameters
# For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone, :date_of_birth, :gender])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone, :date_of_birth, :gender])
  end

  private

  def skip_pundit?
  devise_controller? || params[:controller] =~
  /(^(rails_)?admin)|(^pages$)/

  end

end
