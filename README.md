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


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|gender|int|null: false|
|mail|string|null: false, unique: true|
|address|string|null: false|

### Association
- has_many :products
- has_many :messages


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|null: false|
|price|int|null: false|
|seller-id|int|null: false|
|buyer-id|int||

### Association
- belongs_to :user
- has_many :messages
