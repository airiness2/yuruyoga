class ContinuedAnnounceMailer < ApplicationMailer
  def continued_mail(user, continued_diary)
    @user = user
    @continued_diary = continued_diary
    mail to: user.email, subject: "【ゆるヨガ日記】日記30日継続通知メール"
  end

  def uncontinued_mail(user, continued_diary)
    @user = user
    @continued_diary = continued_diary
    if File.open("./uncontinued_user_list.txt", "r").grep(/^#{@user.id}$/).empty?
      mail to: user.email, subject: "【ゆるヨガ日記】日記未作成通知メール"
      File.open("./uncontinued_user_list.txt", "a") do |file|
        file.puts(@user.id)
      end
    end
  end

  def remove_from_list(user)
    @user = user
    if File.open("uncontinued_user_list.txt", "r").grep(/@user/)
      File.open("uncontinued_user_list.txt", "w") do |file|
        file.puts(@user.name)
      end
    end
  end
end
