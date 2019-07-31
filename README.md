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
## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|product_name|string|null: false|   <!--商品名-->
|image|string|null: false|       
|state|string|null: false|      　  <!--商品の状態-->
|postage|string|null: false|       <!--配送料の負担-->
|region|string|null: false|　　　　　<!--発送元地域-->
|shipping_date|datetime|null: false|　<!--発送までの日数-->
|price|string|null: false|　　
|saler_id|references|null: false|　　　　<!--出品したuserのid-->
|buyer_id|references|null: false|　　　　<!--購入したuserのid-->


### Association

* belongs_to :users
* has_many :comments

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|comment|text||

### Association

* belongs_to :users
* belongs_to :items

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email |string|| 
|encrypted_password|varchar||
|created_at|datetime||
|updated_at|datetime||
|nickname|varchar|index: true,null: false,unique: true|
|wallet|integer||

### Association

* has_many :comments
* has_many :items