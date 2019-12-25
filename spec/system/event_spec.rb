require 'rails_helper'

RSpec.feature "イベント作成機能", type: :system do
  background do
    FactoryBot.create(:event)

    visit user_session_path

    fill_in 'user_email', with: 'test@example.com'
    fill_in 'user_password', with: 'password'
    click_on 'app_login'
  end

  scenario "イベント一覧のテスト" do
    visit events_path

    expect(page).to have_content 'イベント1'
  end

  scenario "イベント作成のテスト" do
    visit new_event_path

    fill_in 'event_hold_date', with: Time.now.tomorrow.to_date
    fill_in 'event_name', with: 'イベント2'
    fill_in 'event_detail', with: 'イベント詳細2'
    fill_in 'event_place', with: '会津若松'
    fill_in 'event_url', with: 'http://localhost/'

    click_on '登録する'
    expect(page).to have_content 'イベント2'

    click_on '投稿する'
    expect(page).to have_content 'イベント2'

  end

  scenario "イベント編集のテスト" do
    visit events_path

    click_on '編集'
    fill_in 'event_name', with: 'イベント12'

    click_on '更新する'
    expect(page).to have_content 'イベント12'
  end

  scenario "イベント削除のテスト" do
    visit events_path

    click_on '削除'
    page.accept_alert

    expect(page).not_to have_content 'イベント1'
  end

  scenario "他の人の投稿したイベントを削除と編集出来ないのテスト" do
    FactoryBot.create(:user, email: "other@example.com")

    visit destroy_user_session_path
    visit user_session_path

    fill_in 'user_email', with: 'other@example.com'
    fill_in 'user_password', with: 'password'
    click_on 'app_login'

    visit events_path

    expect(page).not_to have_content '削除'
    expect(page).not_to have_content '編集'
  end

  scenario "過去のイベントが表示されないのテスト" do
    visit new_event_path

    fill_in 'event_hold_date', with: "2019/01/01 15:00"
    fill_in 'event_name', with: '過去イベント'
    fill_in 'event_detail', with: '過去イベント詳細'
    fill_in 'event_place', with: '渋谷'
    fill_in 'event_url', with: 'http://localhost/'

    click_on '登録する'
    click_on '投稿する'
    expect(page).not_to have_content '過去イベント'

    check 'all_events'
    click_on '表示'
    expect(page).to have_content '過去イベント'
  end
end
