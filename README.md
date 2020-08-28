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
| Column                 | Type   | Options     | 
|------------------------|--------|-------------|
|nickname                |string  |null: false  |
|email                   |string  |null: false  |
|password                |string  |null: false  |
|password_confirmation   |string  |null: false  |
|first_name              |string  |null: false  |
|last_name               |string  |null: false  |
|first_name_kana         |string  |null: false  |
|last_name_kana          |string  |null: false  |
|birth_date              |day     |null: false  |

### Association

- has_many :items
- has_many :purchases


## items テーブル
| Column                 | Type       | Options                        | 
|------------------------|------------|--------------------------------|
|name                    |string      |null: false                     |
|price                   |string      |null: false                     |
|user                    |references  |null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :purchase


##　purchases テーブル
| Column           | Type       | Options                        | 
|------------------|------------|--------------------------------|
|postal_code       |string      |null: false                     |
|city              |string      |null: false                     |
|addresses         |string      |null: false                     |
|building          |string      |                                |
|phone_number      |string      |null: false                     |
|user              |references  |null: false, foreign_key: true  |
|item              |references  |null: false, foreign_key: true  |


### Association

- belongs_to :user
- belongs_to :purchase



