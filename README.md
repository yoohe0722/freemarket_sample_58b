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


## Usersテーブル
| Column         | Type        | option                         |
|:---------------|:------------|:-------------------------------|
| nick_name      | string      | null: false                    |
| email          | string      | null: false, unique: true      |
| password       | string      | null: false                    |
| family_name    | string      | null: false                    |
| first_name     | string      | null: false                    |
| family_kana    | string      | null: false                    |
| first_kana     | string      | null: false                    |
| birth_year     | int         | null: false                    |
| birth_month    | int         | null: false                    |
| birth_day      | int         | null: false                    |
| phone_number   | string      | null: false, unique: true      |
| zip            | integer     | null: false                    |
| prefecture     | integer     | null: false                    |
| city           | string      | null: false                    |
| block          | string      | null: false                    |
| building       | string      | null: false                    |
| user_id        | reference   | null: false, foreign_key: true |
| profile        | text        |                                |
| payment_id     | reference   | foreign_key: true              |
| image          | text        |                                |

### Association
- has_many :items
- has_one :address,foreign_key: true
- has_one: payment, foreign_key: true



## Itemsテーブル
| Column            | Type      | Options                        |
|:------------------|:----------|:-------------------------------|
| name              | string    | null: false                    |
| price             | string    | null: false                    |
| description       | text      | null: false                    |
| condition         | string    | null: false                    |
| user_id           | reference | null: false, foreign_key: true |
| buyer_id          | reference | foreign_key: true              |
| size_id           | reference | foreign_key: true              |
| image_id          | reference | null: false, foreign_key: true |
| category_id       | reference | null: false, foreign_key: true |
| brand_id          | reference | foreign_key: true              |
| prefecture        | integer   | null: false                    |
| ship_fee          | string    | null: false                    |
| ship_method       | integer   | null: false                    |
| ship_date         | integer   | null: false                    |
| trading_condition | string    | null: false                    |


### Association
- belongs_to :user
- belongs_to :prefecture
- belongs_to :size
- belongs_to :brand
- belongs_to :category
- belongs_to :image :dependent => :destroy
- has_one: buyer_id ,foreign_key: “user_id”
- has_one: user_id, foreign_key: “buyer_id”


## Addressesテーブル
| Column           | Type      | Options                        |
|:-----------------|:----------|:-------------------------------|
| zip              | integer   | null: false                    |
| prefecture       | integer   | null: false                    |
| city             | string    | null: false                    |
| block            | string    | null: false                    |
| building         | string    | null: false                    |
| user_id          | reference | null: false, foreign_key: true |

## Association
- has_one :user, foreign_key: true


## Sizesテーブル
| Column         | Type        | option                        |
|:---------------|:------------|:------------------------------|
| name           | string      | null: false                   |
| path           | string      |                               |
| item_id        | refernce    | null: false foreign_key: true |

## Association
- has_many :items


## Categoriesテーブル
| Column         | Type        | option                        |
|:---------------|:------------|:------------------------------|
| name           | string      | null: false                   |
| path           | string      |                               |
| item_id        | refernce    | null: false foreign_key: true |

## Association
- has_many :items


## Brandsテーブル
| Column         | Type        | option                        |
|:---------------|:------------|:------------------------------|
| name           | string      | null: false                   |
| item_id        | refernce    | null: false foreign_key: true |

## Association
- has_many :items


## Imagesテーブル
| Column         | Type        | option                        |
|:---------------|:------------|:------------------------------|
| image          | string      | null: false                   |
| item_id        | refernce    | null: false foreign_key: true |

## Association
- belongs_to :item


## Paymentsテーブル
| Column         | Type        | option                        |
|:---------------|:------------|:------------------------------|
| user_id        | reference   | null: false foreign_key: true |
| customer_id    | reference   | null: false foreign_key: true |

## Association
- has_one :user, foreign_key: true
