# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

Association
・has_many:items
・has_many:history


## items テーブル

| Column         | Type   | Options                       |
| ------------------| ------ | ------------------------------|
| name              | string | null: false                   |
| detail            | text   | null: false                   |
| category_id       | integer| null: false,foreign_key: true |
| condition_id      | integer| null: false                   |
| delivery_charge_id| integer| null: false                   |
| prefecture_id     | integer| null: false                   |
| handling_time_id  | integer| null: false                   |
| user              |references| null: false,foreign_key: true |
| price             | integer| null: false                   |
| brand_id          | integer| null: false,foreign_key: true |

・belongs_to :images
・belongs_to :category
・belongs_to :brands
・belongs_to :user
・belongs_to :history


## history テーブル

| Column             | Type      | Options                        |
| ------------------ | ----------| ------------------------------ |
| user               |references | null: false,foreign_key: true |
| item               |references | null: false,foreign_key: true |

・belongs_to :user


## addresses テーブル

| Column             | Type      | Options                        |
| ------------------ | ----------| ------------------------------ |
| post_cord          | string    | null: false |
| prefecture_id      | integer　　| null: false                   |
| city               | string    | null: false |
| adress             | string    | null: false |
| building           | string    |             |
| phone_number       | string    | null: false |
| history_id         | integer   | null: false,foreign_key: true|

・belongs_to :history

## images テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| image   | references | null: false,                   |
| item_id | references | null: false, foreign_key: true |

・belongs_to :usere
・belongs_to :items


## categories テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| category| string     | null: false |
| ancestry| references | null: false |

・has_many :items


## brands テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| brands  | string     | index: true                    |

・has_many :items


## card テーブル

| Column     | Type       | Options                        |
| -----------| ---------- | ------------------------------ |
| user_id    | integer    | null: false, foreign_key: true |
| customer_id| string     | null: false,                   |
| card_id    | string     | null: false,                   |

・belongs_to :user
