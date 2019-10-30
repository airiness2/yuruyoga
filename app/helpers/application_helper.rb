module ApplicationHelper
  def admin_flg
    raise Forbidden unless logged_in? && current_user.admin?
  end

  def logged_in?
    current_user.present?
  end

  def sign_in(user)
    self.current_user = user
  end
end
