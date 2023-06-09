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
・has_many:histories


## items テーブル

| Column         | Type   | Options                       |
| ------------------| ------ | ------------------------------|
| name              | string | null: false                   |
| detail            | text   | null: false                   |
| category_id       | integer| null: false                   |
| condition_id      | integer| null: false                   |
| delivery_charge_id| integer| null: false                   |
| prefecture_id     | integer| null: false                   |
| handling_time_id  | integer| null: false                   |
| user              |references| null: false,foreign_key: true |
| price             | integer| null: false                   |

・belongs_to :user
・has_one :history


## orderers テーブル

| Column             | Type      | Options                        |
| ------------------ | ----------| ------------------------------ |
| user               |references | null: false,foreign_key: true |
| item               |references | null: false,foreign_key: true |

・belongs_to :user
・belongs_to :item
・has_one :address


## addresses テーブル

| Column             | Type      | Options                        |
| ------------------ | ----------| ------------------------------ |
| post_cord          | string    | null: false |
| prefecture_id      | integer　　| null: false                   |
| city               | string    | null: false |
| address             | string    | null: false |
| building           | string    |             |
| phone_number       | string    | null: false |
| history            | references| null: false,foreign_key: true|

・belongs_to :history

