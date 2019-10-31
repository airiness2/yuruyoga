module ApplicationHelper
  def admin_flg
    raise Forbidden unless user_signed_in? && current_user.admin?
  end

  def sign_in(user)
    self.current_user = user
  end
end
