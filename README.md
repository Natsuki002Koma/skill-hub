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
| user         | references | null: false, foreign_key: true |

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