class ContinuedAnnounceMailer < ApplicationMailer
  def continued_mail(user, continued_diary)
    @user = user
    @continued_diary = continued_diary
    mail to: user.email, subject: "【ゆるヨガ日記】日記継続通知メール"
  end
end
