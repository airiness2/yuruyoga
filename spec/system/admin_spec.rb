require 'rails_helper'

RSpec.feature "管理画面機能", type: :system do
  background do
    FactoryBot.create(:user, :admin_user)
    FactoryBot.create(:pose)
    FactoryBot.create(:effect)
    FactoryBot.create(:tag)

    visit user_session_path
    fill_in 'user_email', with: 'test@example.com'
    fill_in 'user_password', with: 'password'
    click_on 'ログイン'
  end

  scenario "管理画面のアクセスのテスト" do
    visit destroy_user_session_path

    visit user_session_path
    fill_in 'user_email', with: 'unknown@example.com'
    fill_in 'user_password', with: 'password'
    click_on 'ログイン'

    visit admin_index_path
    expect(page).to have_content '権限がありません'
  end

  scenario "管理画面のテスト" do
    visit admin_index_path
    expect(page).to have_content 'ポーズ編集'
    expect(page).to have_content 'ユーザ編集'
    expect(page).to have_content '効果編集'
    expect(page).to have_content 'タグ編集'
  end

  scenario "ポーズ作成のテスト" do
    visit new_admin_pose_path
    fill_in 'ポーズ名(日本語)', with: 'ポーズサンプル'
    fill_in 'ポーズ名(サンスクリット語)', with: 'ポーズサンプル(サンスクリット語)'
    fill_in 'ポーズ詳細', with: 'ポーズサンプル詳細'
    click_on '登録する'
    expect(page).to have_content 'ポーズサンプル'
  end

  scenario "効果作成のテスト" do
    visit new_admin_effect_path
    fill_in 'effect_name', with: '効果サンプル'
    click_on '登録する'
    expect(page).to have_content '効果サンプル'
  end

  scenario "タグ作成のテスト" do
    visit new_admin_tag_path
    fill_in 'tag_name', with: 'タグサンプル'
    click_on '登録する'
    expect(page).to have_content 'タグサンプル'
  end

  scenario "ユーザ作成のテスト" do
    visit new_admin_user_path
    fill_in '名前', with: 'テストユーザ'
    fill_in 'メールアドレス', with: 'test5@example.com'
    fill_in 'パスワード', with: 'password'
    click_on '登録する'
    expect(page).to have_content 'テストユーザ'
  end
end
