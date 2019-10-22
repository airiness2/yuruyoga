require 'rails_helper'

RSpec.feature "日記作成機能", type: :feature do
  background do
    FactoryBot.create(:user)
    FactoryBot.create(:diary)

    visit user_session_path

    fill_in 'user_email', with: 'test@example.com'
    fill_in 'user_password', with: 'password'
    click_on 'ログイン'
  end

  scenario "日記一覧のテスト" do
    visit diaries_path

    expect(page).to have_content '本文'
  end

  scenario "日記作成のテスト" do
    visit new_diary_path

    fill_in 'diary_title', with: '日記2'
    fill_in 'diary_body', with: '本文2'
    fill_in 'diary_pose', with: 1
    fill_in 'diary_worked_date', with: '2019/10/19'
    select 3, :from => 'diary_rank'

    click_on '登録する'
    expect(page).to have_content '本文2'
  end

end
