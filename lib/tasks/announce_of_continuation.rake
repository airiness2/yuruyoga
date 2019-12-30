namespace :announce_of_continuation do
  desc "日記30日継続・通知バッチ"
  task continued_diary: :environment do
    @users = User.where(created_at: Time.at(0)...30.days.ago)

    @users.each do |user|
      @continued_diary = Diary.where(user_id: user.id).where(worked_date: Time.zone.today.ago(30.days)..Time.zone.yesterday).count

      if @continued_diary == 30
        ContinuedAnnounceMailer.continued_mail(user, @continued_diary).deliver
      elsif @continued_diary == 0
        ContinuedAnnounceMailer.uncontinued_mail(user, @continued_diary).deliver
      else
        if File.open("./uncontinued_user_list.txt", "r").grep(/^#{user.id}$/)
          accepted_user = File.readlines("./uncontinued_user_list.txt").reject { |line| line =~ /^#{user.id}$/ }
          File.open("./uncontinued_user_list.txt", "w") { |f| accepted_user.each { |line| f.puts line } }
        end
      end
    end
  end
end
