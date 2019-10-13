# README

# ゆるヨガアプリ

## 概要
「無理なく継続」をテーマに、1日1つのヨガポーズを記録していく簡単な日記アプリです。

## コンセプト
ポーズを毎日1つずつ登録していくシンプル日記

## バージョン
Ruby 2.6.4 Rails 5.2.3

## 機能一覧
- ログイン機能
- ユーザー登録機能
 - メールアドレス、名前、パスワード、管理者フラグは必須
- パスワード再設定機能
- 日記一覧表示機能
- 日記投稿機能
 - ポーズとコメントとランクは必須
- 日記編集機能
- 日記削除機能
 - 日記編集と日記削除は投稿者のみ実行可能
 - 日記お気に入り機能
 - 自分自身のブログにはお気に入りできない
- コメント投稿機能
- コメント編集機能
- コメント削除機能
 - コメントの編集と削除は投稿者のみ実行可能
- メッセージ一覧表示機能
- メッセージ投稿機能
- ユーザ間フォロー機能
- ポーズ一覧表示機能
- ポーズ編集機能
 - ポーズ名(日本語)は必須
- ポーズ削除機能
 - ポーズの追加、修正、削除は管理者のみが実行可能
- 効果一覧表示機能
- 効果編集機能
 - 効果は必須
- 効果削除機能
 - 効果の追加、修正、削除は管理者のみが実行可能
- タグ一覧表示機能
- タグ編集機能
 - タグ名は必須
- タグ削除機能
 - タグの追加、修正、削除は管理者のみが実行可能
- イベント一覧表示機能
- イベント編集機能
 - イベント名は必須
- イベント削除機能
 - イベント編集とイベント削除は作成者のみ実行可能
- ランキング表示機能
- 管理者専用画面

# カタログ設計
https://docs.google.com/spreadsheets/d/e/2PACX-1vSUhdglDMwVH-9Ppo3w_YY2w59Xyx-ZhM-MtZnW9Rn2LLyGMXk35CoNfQ7WyMrBfxj5GVuYRzYu7gmg/pubhtml?gid=1177389026&single=true

# テーブル定義
https://docs.google.com/spreadsheets/d/1f-t6RccwFEQwvopYyBsXF6qiU87eyAfOvXBnt-eXU6o/edit?usp=sharing

# 画面遷移図
https://docs.google.com/spreadsheets/d/1X7lMTgVoY-N8ZGaf8mDnAfSu4ka4OORQWLX9h5Z5EXc/edit?usp=sharing

# 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1BvqCrjRN9P6qL5QE8jn0Q4I3MR_ObCaoB5cMTSliwN0/edit#gid=0

# 使用予定Gem
- carrierwave
- mini_magick
- devise
- chartkick
- kaminari
- ransack
- Friendly ID

# 必要要件

### 【就業Termから少なくとも2つ】

- devise
- コメント機能
- メッセージ機能

### 【カリキュラム外から１つ】

- 楽天WEBサービスAPIを使い、ECサイトのヨガウェア情報を表示
