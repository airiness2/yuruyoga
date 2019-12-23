require 'rails_helper'

RSpec.feature "ポーズ機能", type: :system do
  background do
    FactoryBot.create(:user)
    FactoryBot.create(:pose)

    visit user_session_path

    fill_in 'user_email', with: 'test@example.com'
    fill_in 'user_password', with: 'password'
    click_on 'app_login'
  end

  scenario "ポーズ一覧のテスト" do
    visit poses_path

    expect(page).to have_content 'ポーズ1'
  end

  scenario "ポーズ詳細のテスト" do
    visit poses_path

    click_on '詳細'
    expect(page).to have_content 'ポーズ1'
  end

  scenario "ポーズ検索のテスト" do
    visit poses_path

    fill_in 'q_sans_name_cont', with: 'ポーズ1-1'
    click_on '検索'

    expect(page).to have_content 'ポーズ1-1'
  end
end
