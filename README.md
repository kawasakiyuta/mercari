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

## productsテーブル

|Column          |Type      |Options                  |
|----------------|----------|-------------------------|
|product_name    |string    |null: false              |  <!--商品名-->
|product_state   |integer   |null:                    |  <!--商品の状態-->
|price           |string    |null: false              |　
|sold            |boolean   |null: false              |　<!--売れたかどうか-->　
|user_id         |references|null: false              |　<!--出品したuser_id-->
|buyer_id        |integer   |null: false              |　<!--購入したuser_id-->
|cost_bearer     |string    |null: false              |
|delivery_method |string    |null: false              |
|delivery_souce  |string    |null: false              |
|day_to_ship     |integer   |null: false              |

### Association

* belongs_to :user
* has_many   :comments   ,dependent: :destroy
* belongs_to :brand
* has_many   :likes      ,dependent: :destroy
* has_many   :thee_paths
* belongs_to :saler      ,dependent: :destroy
* belongs_to :buyer      ,dependent: :destroy
* has_many   :images   ,dependent: :destroy


## imagesテーブル
|Column           |Type      |Options                     |
|-----------------|----------|----------------------------|
|product_id       |references|null: false,foreign_key:true|
|image        |string    |null: false|

### Association

* belongs_to :products



## thee_pathsテーブル

|Column           |Type      |Options                     |
|-----------------|----------|----------------------------|
|product_id       |references|null: false,foreign_key:true|
|category         |integer   |null: false                 |
|path             |integer   |null: false                 |

### Association

* belongs_to :product


## brandsテーブル

|Column        |Type      |Options                  |
|--------------|----------|-------------------------|
|name          |string    |null: false              |

### Association

* has_many   :products


## commentsテーブル

|Column  |Type       |Options                       |
|--------|-----------|------------------------------|
|user_id |references |null: false, foreign_key: true|
|product_id |references |null: false, foreign_key: true|
|comment |text       |null: false                   |

### Association

* belongs_to :user
* belongs_to :product


## messagesテーブル

|Column  |Type       |Options                       |
|--------|-----------|------------------------------|
|buyer_id |references |null: false, foreign_key: true|
|saler_id |references |null: false, foreign_key: true|
|product_id |references |null: false, foreign_key: true|
|message |text       |null: false                   |

### Association

* belongs_to :buyer_id
* belongs_to :saler_id
* belongs_to :product_id


## usersテーブル

|Column             |Type    |Options                             |
|-------------------|--------|------------------------------------|
|nickname           |string  |index: true,null: false,unique:true |
|email              |string  |null: false                         | 
|encrypted_password |string  |null: false                         |
|first_name         |string  |null: false                         |
|last_name          |string  |null: false                         |
|first_name_kana    |string  |null: false                         |
|last_name_kana     |string  |null: false                         |
|birthday           |date    |null: false                         |
|phone_number       |integer |null: false                         |
|created_at         |datetime|null: false                         |
|updated_at         |datetime|null: false                         |
|wallet             |integer |null: false                         |
|postcode           |string  |null: false                         |
|prefecture         |string  |null: false                         |
|city               |string  |null: false                         |
|block              |string  |null: false                         |
|building           |string  |                                    |
|profile_image      |string  |                                    |
|profile_comment    |text    |                                    |

### Association

* has_many   :comments,dependent: :destroy
* has_many   :products,dependent: :destroy
* has_many :likes


## evaluationsテーブル

|Column             |Type       |Options                       |
|-------------------|-----------|------------------------------|
|user_id            |references |null: false, foreign_key: true|
|evaluator_ id      |integer    |null: false, foreign_key: true|<!--評価された人 -->　
|comment            |text       |null: false,                  |<!--評価した人-->　
|satisfaction_level |string     |null: false,                  |
|seller_bit         |boolean    |null: false,                  |
### Association

* belongs_to: :user


## likesテーブル

|Column  |Type       |Options                       |
|--------|-----------|------------------------------|
|user_id |references |null: false, foreign_key: true|
|product_id |references |null: false, foreign_key: true|
### Association

* belongs_to :user
* belongs_to :product


## salersテーブル

|Column  |Type       |Options                       |
|--------|-----------|------------------------------|
|user_id |references |null: false, foreign_key: true|
### Association

* belongs_to :product
* has_many :massages

## buyersテーブル

|Column  |Type       |Options                       |
|--------|-----------|------------------------------|
|user_id |references |null: false, foreign_key: true|
### Association

* belongs_to :product
* has_many :massages