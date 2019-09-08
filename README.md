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
| Column         | Type        | option                       |
|:---------------|:------------|:-----------------------------|
| nick_name      | string      | null: false                  |
| email          | string      | null: false, unique: true    |
| password       | string      | null: false                  |
| first_name     | string      | null: false                  |
| family_name    | string      | null: false                  |
| first_kana     | string      | null: false                  |
| family_kana    | string      | null: false                  |
| birth_year     | int         | null: false                  |
| birth_month    | int         | null: false                  |
| birth_day      | int         | null: false                  |
| prefecture     | string      | null: false                  |
| phone_number   | string      | null: false, unique: true    |
| municipalities | string      | null: false                  |
| address        | string      | null: false                  |
| building       | string      | null: false                  |
| profile        | text        |                              |

### Association
- has_many :items
- has_many :messages
- has_many :comments
- has_many :likes
- has_many :reviews
<!-- phone_number int→stringに変更 -->


## itemsテーブル
| Column         | Type        | option                       |
|:---------------|:------------|:-----------------------------|
| name           | string      | null: false                  |
| image          | string      | null: false                  |
| price          | int         | null: false                  |
| seller-id      | int         | null: false                  |
| buyer-id       | int         |                              |

### Association
- belongs_to :user
- has_many :messages


## Sizesテーブル
| Column         | Type        | option                        |
|:---------------|:------------|:------------------------------|
| size           | strings     | null: false                   |
| path           | strings     | null: false                   |
| item-id        | refernces   | null: false foreign_key: true |
## Association
- has_many :items


## Categoriesテーブル
| Column         | Type        | option                        |
|:---------------|:------------|:------------------------------|
| category       | strings     | null: false                   |
| path           | strings     |                               |
| item-id        | refernces   | null: false foreign_key: true |
## Association
- has_many :items


## Brandsテーブル
| Column         | Type        | option                        |
|:---------------|:------------|:------------------------------|
| name           | strings     |                               |
| item-id        | refernces   | null: false foreign_key: true |
## Association
- has_many :items


## Prefucturesテーブル
| Column         | Type        | option                        |
|:---------------|:------------|:------------------------------|
| name           | strings     | null: false                   |
| item-id        | refernces   | null: false foreign_key: true |
## Association
- has_many :items


## Imagesテーブル
| Column         | Type        | option                        |
|:---------------|:------------|:------------------------------|
| image          | strings     | null: false                   |
| item-id        | refernces   | null: false foreign_key: true |
## Association
- belongs_to :item


<!-- ## Commentsテーブル -->
<!-- ## Likesテーブル -->
<!-- ## Reviewsテーブル -->