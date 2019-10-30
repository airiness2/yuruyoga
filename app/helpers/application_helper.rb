module ApplicationHelper
  def admin_flg
    raise Forbidden unless logged_in? && current_user.admin?
  end
end
