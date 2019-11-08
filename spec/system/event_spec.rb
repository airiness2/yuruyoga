require 'rails_helper'

RSpec.feature "イベント作成機能", type: :system do
  background do
    FactoryBot.create(:event)

    visit user_session_path

    fill_in 'user_email', with: 'test@example.com'
    fill_in 'user_password', with: 'password'
    click_on 'ログイン'
  end

  scenario "イベント一覧のテスト" do
    visit diaries_path

    expect(page).to have_content 'タイトル'
  end

  scenario "イベント作成のテスト" do
    visit new_event_path

    select '2019', :from => 'event_hold_date_1i'
    select '12月', :from => 'event_hold_date_2i'
    select '22', :from => 'event_hold_date_3i'
    select '13', :from => 'event_hold_date_4i'
    select '00', :from => 'event_hold_date_5i'
    fill_in 'event_name', with: 'イベント2'
    fill_in 'event_detail', with: 'イベント詳細2'
    fill_in 'event_place', with: '会津若松'
    fill_in 'event_url', with: 'http://localhost/'

    click_on '登録する'
    expect(page).to have_content 'イベント2'
  end

  scenario "イベント編集のテスト" do
    visit events_path

    click_on '編集'
    fill_in 'event_name', with: 'イベント12'

    click_on '更新する'
    expect(page).to have_content 'イベント12'
  end

end
