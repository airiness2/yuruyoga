require 'rails_helper'

RSpec.feature "ユーザ機能", type: :system do
  background do
    FactoryBot.create(:user)
    visit user_session_path
    fill_in 'user_email', with: 'test@example.com'
    fill_in 'user_password', with: 'password'
    click_on 'app_login'
  end

  scenario "プロフィールのテスト" do
    visit root_path
    click_on 'プロフィール'
    expect(page).to have_content 'test'
  end

  scenario "プロフィール更新のテスト" do
    visit root_path
    click_on 'プロフィール'
    click_on 'プロフィールを更新する'
    fill_in 'user_name', with: 'change_name_to_test2'
    click_on '更新する'
    expect(page).to have_content 'change_name_to_test2'
  end

  scenario "他のユーザのフォローボタンのテスト" do
    user = FactoryBot.create(:user, email: "other@example.com")
    visit user_path(user.id)
    expect(page).to have_selector(:link_or_button, 'フォロー')
    click_on 'フォロー'
    expect(page).to have_selector(:link_or_button, 'つながりを解除')
  end
end
