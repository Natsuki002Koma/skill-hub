# アプリケーション名
skill-hub

# アプリケーション概要
自己研鑽中の取り組みをチーム内にシェアできるほか、プロジェクトメンバーをアサインし、メンバー同士でコミュニケーションがとれます。

# URL
https://skill-hub.onrender.com/

# テスト用アカウント
・Basic認証ID:admin  
・Basic認証パスワード:2222  
・メールアドレス：123＠gmail.com  
・パスワード：123456  

# 利用方法
## スキル管理機能
習得したい/学習中のスキルの種類・ステータス・スキルレベルを登録できます。  
スキルごとにコメントを投稿でき、コメントはチーム内にシェアされます。  
自身の学習の記録のため、チームメンバーとコメントしあって切磋琢磨するために活用します。

## プロジェクト管理機能
プロジェクトの概要やメンバーを登録し、プロジェクトメンバー内でコミュニケーションが取れるチャットルームを作成します。  
打ち合わせの日程調整をプロジェクトごとに簡単に行えます。

# アプリケーションを作成した背景
職場においてメンバー個人のスキルが「見える化」できていないことで、自己研鑽のモチベーションが上がらなかったり、メンバー同士のバックグラウンドが分からずコミュニケーションを取りづらかったりする状況を変えたいと思っていました。  
また、プロジェクトメンバーをアサインする際に、メンバーの希望やスキルが別のツールに保存されているなどで、現場がリアルタイムにメンバー各自のスキルレベルや希望を反映・共有できないことも課題感を持っていました。

# 実装した機能についての画像やGIFおよびその説明

## スキルの登録とコメントの発信
自身が取り組んでいる学習や、興味のあるスキルを登録し、取り組み状況を他メンバーに発信できます。また、他メンバーの発信も閲覧でき、コメントを送ることができます。メンバー同士で切磋琢磨しながらスキルアップに取り組む場として活用できます。
https://gyazo.com/867afd4ed0cb2c44606f71f3265882e4

## プロジェクトの登録とチャットルーム
新規プロジェクトの登録（概要の登録、メンバーのアサイン）をすると、チャットルームが作成され、プロジェクトメンバー内でコミュニケーションが取ることができます。
https://gyazo.com/fbcec64afc2739c28e43b07391e17b16

# 実装予定の機能
## 日程調整機能
各プロジェクトページから、プロジェクトメンバー内で打ち合わせを行う際に日程調整を簡単に行える機能を追加します。

## スキルレベルの変更
管理者権限を付与されたユーザーは、メンバーのスキルレベルを変更できる機能を追加します。一般権限のユーザーはスキルレベルの変更申請を送ることができます。

# データベース設計
https://gyazo.com/740d23ed37fdd6799a443130b22fc590

# 画面遷移図

# 開発環境

# ローカルでの動作方法
以下のコマンドを順に実行  
% git clone https://github.com/Natsuki002Koma/skill-hub.git  
% cd skill-hub  
% bundle install  
% yarn install  

# 工夫したポイント

# 改善点

# 制作時間

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| hire_date          | date   | null: false               |

### Association

- has_many :skills
- has_many :tweets
- has_many :projects, through: :project_users (phase2)
- has_many :project_users (phase2)
- has_many :schedules (phase3)

## skills テーブル

| Column          | Type       | Options                            |
| --------------- | ---------- | ---------------------------------- |
| skill_name      | string     | null: false                        |
| skill_status_id | string     | null: false                        |
| skill_level     | integer    |                                    |
| user            | references | null: false, foreign_key: true     |

ActiveHash: skill_status

### Association

- belongs_to :user
- has_many :tweets

## tweets テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| text         | string     | null: false                    |
| skill        | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

image:ActiveStorageを用いて実装

### Association

- belongs_to :skill
- belongs_to :user

## projects テーブル(phase2)

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| project_name | string     | null: false                    |
| description  | text       | null: false                    |

ファイル投稿機能を実装

### Association

- has_many :users, through: :project_users
- has_many :project_users
- has_many :messages

## project_users テーブル(phase2)

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| project   | references | null: false, foreign_key: true |

### Association

- belongs_to :project
- belongs_to :user

## messages テーブル(phase2)

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| content      | string     | null: false                    |
| project      | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

ファイル投稿機能を実装

### Association

- belongs_to :project
- belongs_to :user

## schedules テーブル(phase3)

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| date_id      | integer    | null: false                    |
| time_id      | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

ActiveHash: date, time

### Association

- belongs_to :user
- has_one :meeting

## meetings テーブル(phase3)

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| status_id    | integer    | null: false                    |
| title        | string     | null: false                    |
| note         | string     |                                |
| schedule     | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |
| project      | references | null: false, foreign_key: true |

ActiveHash: status

### Association

- belongs_to :user
- belongs_to :project
- belongs_to :schedule