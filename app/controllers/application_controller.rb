class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(@user)
  end

  class Forbidden < ActionController::ActionControllerError
  end

  rescue_from Forbidden, with: :rescue403

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar, :admin])
  end

  private

  def rescue403(err)
    @exception = err
    render template: 'errors/forbidden', status: 403
  end

  def admin_flg
    raise Forbidden unless user_signed_in? && current_user.admin?
  end
end
