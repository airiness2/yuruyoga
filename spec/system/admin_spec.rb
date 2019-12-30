require 'rails_helper'

RSpec.feature "管理画面機能", type: :system do
  background do
    FactoryBot.create(:user, :admin_user)
    FactoryBot.create(:pose)
    FactoryBot.create(:effect)
    FactoryBot.create(:tag)
    FactoryBot.create(:request)
    visit user_session_path
    fill_in 'user_email', with: 'test@example.com'
    fill_in 'user_password', with: 'password'
    click_on 'app_login'
  end

  scenario "管理画面のアクセスのテスト" do
    visit destroy_user_session_path
    visit user_session_path
    fill_in 'user_email', with: 'unknown@example.com'
    fill_in 'user_password', with: 'password'
    click_on 'app_login'
    visit admin_index_path
    expect(page).to have_content '権限がありません'
  end

  scenario "管理画面のテスト" do
    visit admin_index_path
    expect(page).to have_content 'ポーズ'
    expect(page).to have_content 'ユーザ'
    expect(page).to have_content '効果'
    expect(page).to have_content 'タグ'
  end

  scenario "ポーズ作成のテスト" do
    visit new_admin_pose_path
    fill_in 'ポーズ名(日本語)', with: 'ポーズサンプル'
    fill_in 'ポーズ名(サンスクリット語)', with: 'ポーズサンプル(サンスクリット語)'
    fill_in 'ポーズ詳細', with: 'ポーズサンプル詳細'
    click_on '登録する'
    expect(page).to have_content 'ポーズサンプル'
  end

  scenario "ポーズ編集のテスト" do
    visit admin_poses_path
    expect(page).to have_content 'ポーズ1'
    all('td')[-2].click_link "編集"
    fill_in 'pose_name', with: 'ポーズ編集テスト'
    click_on '更新する'
    expect(page).to have_content 'ポーズ編集テスト'
  end

  scenario "ポーズ削除のテスト" do
    visit admin_poses_path
    expect(page).to have_content 'ポーズ1'
    all('td')[-1].click_link "削除"
    page.accept_alert
    expect(page).not_to have_content 'ポーズ1'
  end

  scenario "効果作成のテスト" do
    visit new_admin_effect_path
    fill_in 'effect_name', with: '効果サンプル'
    click_on '登録する'
    expect(page).to have_content '効果サンプル'
  end

  scenario "効果編集のテスト" do
    visit admin_effects_path
    expect(page).to have_content '効果1'
    all('td')[-2].click_link "編集"
    fill_in 'effect_name', with: '効果編集テスト'
    click_on '更新する'
    expect(page).to have_content '効果編集テスト'
  end

  scenario "効果削除のテスト" do
    visit admin_effects_path
    expect(page).to have_content '効果1'
    all('td')[-1].click_link "削除"
    page.accept_alert
    expect(page).not_to have_content '効果1'
  end

  scenario "タグ作成のテスト" do
    visit new_admin_tag_path
    fill_in 'tag_name', with: 'タグサンプル'
    click_on '登録する'
    expect(page).to have_content 'タグサンプル'
  end

  scenario "タグ編集のテスト" do
    visit admin_tags_path
    expect(page).to have_content 'タグ1'
    all('td')[-2].click_link "編集"
    fill_in 'tag_name', with: 'タグ編集テスト'
    click_on '更新する'
    expect(page).to have_content 'タグ編集テスト'
  end

  scenario "タグ削除のテスト" do
    visit admin_tags_path
    expect(page).to have_content 'タグ1'
    all('td')[-1].click_link "削除"
    page.accept_alert
    expect(page).not_to have_content 'タグ1'
  end

  scenario "ユーザ作成のテスト" do
    visit new_admin_user_path
    fill_in '名前', with: 'テストユーザ'
    fill_in 'メールアドレス', with: 'test5@example.com'
    fill_in "user_password", with: 'password'
    click_on '登録する'
    expect(page).to have_content 'テストユーザ'
  end

  scenario "ユーザ編集のテスト" do
    FactoryBot.create(:user, email: "other@example.com")
    visit admin_users_path
    expect(page).to have_content 'other@example.com'
    all('td')[-2].click_link "編集"
    fill_in 'user_name', with: 'other_user'
    click_on '更新する'
    expect(page).to have_content 'other_user'
  end

  scenario "ユーザ削除のテスト" do
    FactoryBot.create(:user, email: "other2@example.com")
    visit admin_users_path
    expect(page).to have_content 'other2@example.com'
    all('td')[-1].click_link "削除"
    page.accept_alert
    expect(page).not_to have_content 'other2@example.com'
  end

  scenario "要望ページのテスト" do
    visit admin_requests_path
    expect(page).to have_content '要望のテストです'
    click_on '編集'
    select '完了', from: 'request_status'
    click_on '更新する'
    expect(page).to have_content '完了'
    click_on '戻る'
    expect(page).not_to have_content '要望のテストです'
  end
end
