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
|name            |string    |null: false              |  <!--商品名-->
|state           |integer   |null: false              |  <!--商品の状態-->
|price           |string    |null: false              |<!--値段-->
|sold            |boolean   |null: false,default: false| <!--売れたかどうか-->　
|user_id         |references|null: false,foreign_key:true| <!--出品したuser_id-->
|buyer_id        |integer   |null: false              | <!--購入したuser_id-->
|cost_bearer     |string    |null: false              | <!--送料をどっちが払うか-->
|delivery_method |string    |null: false              |<!--配送方法>
|delivery_souce  |string    |null: false              |<!--配送元地域-->
|day_to_ship     |integer   |null: false              |<!--配送日の目安-->
|category_id     |references|null: false,foreign_key:true|<>
|brand        |string|                                |<!--ブランドの名前-->

### Association

* belongs_to :user
* has_many   :comments ,dependent: :destroy
* belongs_to :brand
* has_many   :likes   ,dependent: :destroy
* has_many   :images  ,dependent: :destroy
* belongs_to :category

## imagesテーブル

|Column           |Type      |Options                     |
|-----------------|----------|----------------------------|
|product_id       |references|null: false,foreign_key:true|
|image            |string    |null: false                 |

### Association

* belongs_to :product



## categoriesテーブル

|Column           |Type      |Options                     |
|-----------------|----------|----------------------------|
|name             |string    |null: false                 |
|ancestry         |string    |                            |

### Association

* has_many :products





## commentsテーブル//値下げのやりとり

|Column     |Type       |Options                       |
|-----------|-----------|------------------------------|
|user_id    |references |null: false, foreign_key: true|
|product_id |references |null: false, foreign_key: true|
|comment    |text       |null: false                   |

### Association

* belongs_to :user
* belongs_to :product


## messagesテーブル//購入後のやりとり

|Column     |Type       |Options                       |
|-----------|-----------|------------------------------|
|user_id    |references |null: false, foreign_key: true|
|product_id |references |null: false, foreign_key: true|
|message    |text       |null: false                   |

### Association
* belongs_to :user
* belongs_to :product




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
|postcode           |string  |null: false                         |
|prefecture         |string  |null: false                         |
|city               |string  |null: false                         |
|block              |string  |null: false                         |
|building           |string  |                                    |
|profile_image      |string  |                                    |
|profile_comment    |text    |                                    |

### Association

* has_many   :comments,dependent: :destroy
* has_many   :messages,dependent: :destroy
* has_many   :products,dependent: :destroy
* has_many   :evaluations,dependent: :destroy
* has_many   :likes


## evaluationsテーブル//購入後の評価

|Column             |Type       |Options                       |
|-------------------|-----------|------------------------------|
|user_id            |references |null: false, foreign_key: true|
|evaluator_ id      |integer    |null: false                   |<!--評価された人 -->　
|comment            |text       |null: false,                  |<!--評価した人-->　
|satisfaction_level |string     |null: false,                  |
|seller_bit         |boolean    |null: false,                  |

### Association

* belongs_to: :user


## likesテーブル

|Column     |Type       |Options                       |
|-----------|-----------|------------------------------|
|user_id    |references |null: false, foreign_key: true|
|product_id |references |null: false, foreign_key: true|

### Association

* belongs_to :user
* belongs_to :product