namespace :announce_of_continuation do
  desc "日記30日継続通知バッチ"
  task continued_diary: :environment do
    @users = User.all

    @users.each do |user|
      @continued_diary = Diary.where(user_id: user.id).where(worked_date: Time.zone.today.ago(30.days)..Time.zone.yesterday).count

      if @continued_diary == 30
        ContinuedAnnounceMailer.continued_mail(user, @continued_diary).deliver
      elsif @continued_diary == 0
        ContinuedAnnounceMailer.uncontinued_mail(user, @continued_diary).deliver
      end
    end
  end
end
