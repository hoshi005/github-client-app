# Githubクライアントアプリ

## 詳細

- GitHubのユーザーを閲覧できるクライアントアプリを作成する
- チーム開発を想定した実装を行う
- また、このアプリを使うユーザーのUXも考慮して開発する

## 条件

- APIは、 https://developer.github.com/v3/ を利用する
- Rate Limitは認証なしの場合、60 requests per hour なのでpersonal access tokenを利用する
    - https://developer.github.com/v3/guides/getting-started/#oauth
- GitHubのサンプルアプリ作成に特化したライブラリは使用しない
- それ以外のライブラリに関して制限はない
- 以下に記載の最低限の仕様を満たすように実装する

## 最低限の仕様

- 以下の仕様で実装する
- 追加機能やアイデアなど盛り込んでいただいてもよい

### ユーザー一覧画面

- ユーザー一覧をリストで表示する
    - https://docs.github.com/ja/rest/reference/search#search-users
- 各行に必要な要素
    - アイコン画像
    - ユーザー名
- 各行を選択することでユーザーリポジトリ画面に遷移する

### ユーザーリポジトリ画面

- リスト上部にユーザーの詳細情報を表示する
    - https://docs.github.com/ja/rest/reference/users#get-a-user
    - アイコン画像
    - ユーザー名
    - フルネーム
    - フォロワー数
    - フォロイー数
- それ以下はforkedリポジトリではないユーザーのリポジトリを一覧表示する
    - https://docs.github.com/ja/rest/reference/repos#list-repositories-for-a-user
    - リポジトリ名
    - 開発言語
    - スター数
    - 説明文
- リポジトリ一覧の行をタップするとWebViewでリポジトリのURLを表示する
