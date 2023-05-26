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
| email              | string | null: false |
| user_password      | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

Association
・has_many:items
・belongs_to :adresses
・belongs_to :card


## items テーブル

| Column         | Type   | Options                       |
| ---------------| ------ | ------------------------------|
| name           | string | null: false                   |
| text           | string | null: false                   |
| condition      | string | null: false                   |
| price          | string | null: false                   |
| fee_burden     | string | null: false                   |
| service        | string | null: false                   |
| handling_time  | string | null: false                   |
| user_id        | integer| null: false,foreign_key: true |
| sales_status   | string | null: false                   |
| category_id    | integer| null: false,foreign_key: true |
| sales_status   | string | null: false                   |
| brand_id       | integer| null: false,foreign_key: true |

・belongs_to :images
・belongs_to :category
・belongs_to :brands
・belongs_to :user





## addresses テーブル

| Column             | Type      | Options                        |
| ------------------ | ----------| ------------------------------ |
| family_name        | string    | null: false |
| first_name         | string    | null: false |
| family_name_kana   | string    | null: false |
| first_name_kana    | string    | null: false |
| post_cord          | string    | null: false |
| prefecture         | string    | null: false |
| city               | string    | null: false |
| adress             | string    | null: false |
| building           | string    |             |
| phone_number       | string    | null: false |
| user_id            | integer   | null: false,foreign_key: true|

・belongs_to :user

## images テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| image   | references | null: false,                   |
| item_id | references | null: false, foreign_key: true |

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
