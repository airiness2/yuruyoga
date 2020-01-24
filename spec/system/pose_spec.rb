require 'rails_helper'

RSpec.feature 'ポーズ機能', type: :system do
  background do
    FactoryBot.create(:user)
    FactoryBot.create(:pose)

    visit user_session_path

    fill_in 'user_email', with: 'test@example.com'
    fill_in 'user_password', with: 'password'
    click_on 'app_login'
  end

  scenario 'ポーズ一覧のテスト' do
    visit poses_path

    expect(page).to have_content 'ポーズ1'
  end

  scenario 'ポーズ詳細のテスト' do
    visit poses_path

    click_on '詳細'
    expect(page).to have_content 'ポーズ1'
  end

  scenario 'ポーズ検索のテスト' do
    visit poses_path

    fill_in 'q_sans_name_cont', with: 'ポーズ1-1'
    click_on '検索'

    expect(page).to have_content 'ポーズ1-1'
  end

  xscenario 'ポーズから日記を書くテスト' do
    visit poses_path

    find('a', text: '日記作成').click
    click_on '日記作成'

    fill_in 'diary_worked_date', with: '2019/12/25'
    fill_in 'diary_title', with: 'ポーズから日記を書く'
    fill_in 'diary_body', with: 'ポーズから日記を書く本文'
    select 5, :from => 'diary_rank'

    click_on '登録する'
    expect(page).to have_content 'ポーズから日記を書く'

    click_on '投稿する'
    expect(page).to have_content 'ポーズから日記を書く'
  end
end
