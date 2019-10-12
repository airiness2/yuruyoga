# README

# ゆるヨガアプリ

## 概要
シンプルにタイトルと記事内容を投稿することに特化したブログサービス お気に入りとコメントを入れることができます。

## コンセプト
シンプルなブログ

## バージョン
Ruby 2.6.3p62 Rails 5.2.3

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
https://docs.google.com/spreadsheets/d/e/2PACX-1vQd2gRbr5vvVzdcXNoBZhw4xcACQU2c9X0E4Cl7DO5-nmn9u-FZzOmE7iAemGOYuEW8bMVJC5Ee3Dhe/pubhtml

# 画面遷移図
https://docs.google.com/spreadsheets/d/e/2PACX-1vSKr7MjMboK8Mcc30K9i8iFBGEHQ3UZrbXURTXFkXQsovNDbODqqjiKgu8xndhkVlQgthu0mDkuvHg-/pubhtml

# 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/e/2PACX-1vTG62YqDK9fyxdGKQPq18YxoL2SYKMCn4LjY2JSzvwiS2PbATtQDxJdEC_kkKijrat8HkxIm4Um-uHt/pubhtml

# 使用予定Gem
- carrierwave
- mini_magick
- devise
- chartkick
- kaminari
- ransack
- Friendly ID
