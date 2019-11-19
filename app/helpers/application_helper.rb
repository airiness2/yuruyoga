module ApplicationHelper
#  def sign_in(user)
#    self.current_user = user
#  end

  def human_boolean(boolean)
    boolean ? 'はい' : 'いいえ'
  end
end
