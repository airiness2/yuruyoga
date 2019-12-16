require 'rails_helper'

RSpec.feature "要望作成機能", type: :system do
  background do
    FactoryBot.create(:user)
    visit user_session_path

    fill_in 'user_email', with: 'test@example.com'
    fill_in 'user_password', with: 'password'
    click_on 'app_login'
  end

  scenario "要望作成のテスト" do
    visit diaries_path

    click_on '要望を送る'

    fill_in 'request_body', with: '要望のテスト送信です'

    click_on '送信する'
    expect(page).to have_content '要望を送信しました!'
  end

  scenario "管理者は要望作成出来ないのテスト" do
    FactoryBot.create(:user, :admin_user, email: "admin@example.com")

    visit destroy_user_session_path
    visit user_session_path

    fill_in 'user_email', with: 'admin@example.com'
    fill_in 'user_password', with: 'password'
    click_on 'app_login'

    visit diaries_path

    expect(page).not_to have_content '要望を送る'
  end

end
