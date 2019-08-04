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

|Column        |Type      |Options    |
|--------------|----------|-----------|
|product_name  |string    |null: false|  <!--商品名-->
|images        |string    |null: false|       
|product_state |integer   |null: false|  <!--商品の状態-->
|price         |string    |null: false|　
|sold          |boolean   |null: false|　　
|saler_id      |references|null: false|　<!--出品したuser_id-->
|buyer_id      |references|null: false|　<!--購入したuser_id-->


### Association

* belongs_to :user
* has_many   :comments
* belongs_to :brand
* has_many   :likes
* belongs_to :delivery
* belongs_to :category


## categoryテーブル

|Column           |Type      |Options    |
|-----------------|----------|-----------|
|category_name    |string    |null: false|
|sub_category     |string    |null: false|
|sub_sub_category |string    |null: false|
|size_type_id     |references|null: false|

### Association

* has_many   :products
* belongs_to :user


## size_typesテーブル

|Column        |Type      |Options                  |
|--------------|----------|-------------------------|
|size          |integer   |null: false              |

### Association

* has_many   :categories

## deliveryテーブル

|Column          |Type      |Options                  |
|----------------|----------|-------------------------|
|product_id      |references|null: false              |
|cost_bearer     |string    |null: false              |
|delivery_method |string    |null: false              |
|delivery_souce  |string    |null: false              |
|day_to_ship     |integer   |null: false              |

### Association

* has_many   :products



## brandテーブル

|Column        |Type      |Options                  |
|--------------|----------|-------------------------|
|name          |string    |null: false              |

### Association

* has_many   :products


## commentsテーブル

|Column  |Type       |Options                       |
|--------|-----------|------------------------------|
|user_id |references |null: false, foreign_key: true|
|item_id |references |null: false, foreign_key: true|
|comment |text       |null: false                   |

### Association

* belongs_to :user
* belongs_to :product


## messagesテーブル

|Column  |Type       |Options                       |
|--------|-----------|------------------------------|
|user_id |references |null: false, foreign_key: true|
|message |text       |null: false                   |

### Association

* belongs_to :user


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

### Association

* has_many   :comments
* has_many   :messages
* has_many   :products
* belongs_to :like
* belongs_to :profile
* belongs_to :evaluation


## evaluationsテーブル

|Column             |Type       |Options                       |
|-------------------|-----------|------------------------------|
|user_id            |references |null: false, foreign_key: true|
|satisfaction_level |string     |null: false,                  |
|messages           |text       |null: false,                  |
### Association

* belongs_to :user


## profileテーブル

|Column          |Type       |Options                       |
|----------------|-----------|------------------------------|
|user_id         |references |null: false, foreign_key: true|
|profile_image   |string     |null: false,                  |
|profile_comment |text       |null: false,                  |
### Association

* belongs_to :user


## likesテーブル

|Column  |Type       |Options                       |
|--------|-----------|------------------------------|
|user_id |references |null: false, foreign_key: true|
|item_id |references |null: false, foreign_key: true|
### Association

* belongs_to :user
* belongs_to :item