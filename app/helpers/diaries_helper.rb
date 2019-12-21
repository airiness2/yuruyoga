module DiariesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_diaries_path
    elsif action_name == 'edit'
      diary_path
    end
  end
end
