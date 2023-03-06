## サービス名: Hontobutai
https://hontobutai.com

## サービス概要
気になる地域や思い入れのある地域が舞台となっている小説や漫画を探したい人向けの、本の紹介・投稿サービスです。

## ユーザーが抱える課題
- 思い入れのある地域が舞台となった作品を知りたい。
- 旅先が登場する本とともに旅行に行きたい。
- 以前の旅行先の思い出に浸るためにその地域が出てくる本を探している。

## 解決方法
選択された地名に紐づく作品(小説、漫画)の一覧を提供します。また、ユーザーが好きな作品と舞台となる地域を紐づけて投稿することで、検索の際に紹介できる作品が増え、ユーザーの利用満足度がアップします。

## 主な機能
### 投稿作成機能
<p align="left">
投稿したい作品を検索・選択し、作品のレビューと本の舞台を入力して投稿を作成します</br>
<img src="https://i.gyazo.com/1404c0a44e4321e84a848ed446e9b19d.png" width="200px" height="335px">

<img src="https://i.gyazo.com/47fc55b347014368fe15b3158c0dab5e.png" width="200px" height="335px">

<img src="https://i.gyazo.com/b6fba8355eaed6b59c5d51a62cbdaba4.png" width="200px" height="335px">
</p>

### 投稿絞り込み機能
世界地図またはセレクトボックスから舞台で作品を絞り込むことができます</br>
<img src="https://i.gyazo.com/e93559fa13aa100fb5c113fca148b57c.png" width="300px" height="500px"></br>

### プロフィール機能
アバターの変更やブックマークした投稿一覧を確認できます</br>
<img src="https://i.gyazo.com/a0ee179fb77f82834cb37026f7e51545.png" width="300px" height="500px"></br>

### その他の機能、静的ページ
- ユーザー登録、ログイン機能、ゲストログイン機能
- 投稿編集、削除機能
- ブックマーク機能
- 利用規約、プライパシーポリシー
- Google フォームでお問い合わせ機能
- 管理画面

## 使用技術
**バックエンド**
- Ruby 3.1.3
- Ruby on Rails 7.0.4 

**フロントエンド**
- JavaScript
- Tailswind CSS-daisyUI

**インフラ**
- PostgreSQL
- Fly.io
- AWS(Amazon S3, Route 53)

**API**
 - Google Books API(本のデータの取得に使用)

### 主要ライブラリ（gem）
- `sorcery`（ユーザー登録、ログイン/ログアウト）
- `kaminari`（ページネーション）
- `gretel`（パンくず）
- `ransack`（投稿検索）
- `faraday`（API通信）
- `rails-i18n`（i18n 国際化対応）
- `cancancan`（権限管理）
- `rails_admin`（管理画面の作成）
- `meta-tags`（OGP、メタタグの設定）
- `rspec-rails`（テストフレームワーク）

## ER図
<img src="https://i.gyazo.com/515c77060fbca841d79348f362e65717.png" width="900px">
