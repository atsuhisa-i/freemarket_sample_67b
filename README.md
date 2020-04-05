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

# freemarket_sample_67b DB設計
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null : false|
|family_name|string|null : false|
|first_name|string|null : false|
|family_name_kana|string|null : false|
|first_name_kana|string|null : false|
|e_mail|string|null : false, unique : true|
|password|string|null : false, unique : true|
|birth_year|date|null : false|
|birth_month|date|null : false|
|birth_day|date|null : false|

### Association
- has_one : credit_card, dependent: :destroy
- has_one : deliver_address, dependent: :destroy
- has_many : items, dependent: :destroy
- has_many : comments, dependent: :destroy
- has_many : likes, through : users-likes, dependent: :destroy
- has_many : users-likes

## deliver_addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null : false, foreign_key : true|
|family_name|string|null : false|
|first_name|string|null :false|
|family_name_kana|string|null : false|
|first_name_kana|string|null : false|
|zip_code|integer(7)|null : false|
|prefecture|string|null : false|
|municipality|string|null : false|
|building_name|string|
|phone_number|integer|

### Association
- belongs_to : user

## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null : false, foreign_key : true|
|card_number|integer|null : false, unique : true|
|year|integer|null : false|
|month|integer|null : false|
|security_number|integer|null : false|

### Association
- belongs_to : user

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null : false, foreign_key : true|
|name|string|null : false|
|explanation|text|null : false|
|size|string|null : false|
|category_id|references|null : false, foreign_key : true|
|brand_id|references|foreign_key : true|
|condition|integer|null : false|
|postage_payer|boolean|null : false|
|shipping_origin|string|null : false|
|days_to_ship|integer|null : false|
|price|integer|null : false|
|trading_status|enum|null : false|

### Association
- belongs_to : user
- belongs_to : category
- belongs_to : brand
- has_many : comments, dependent: :destroy
- has_many : pictures, dependent: :destroy
- has_many : likes, through : items-likes, dependent: :destroy
- has-many : items-likes

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|
|user_id|references|null : false, foreign_key : true|
|item_id|references|null : false, foreign_key : true|

### Association
- belongs_to : user
- belongs_to : item

## pictures

|Column|Type|Options|
|------|----|-------|
|image|string|null : false|
|item_id|references|null : false, foreign_key : true|

### Association
- belongs_to : item

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null : false, foreign_key : true|
|item_id|references|null : false, foreign_key : true|

### Association
- has_many : users-likes
- has_many : items-likes

## items_likesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null : false, foreign_key : true|
|like_id|references|null : false, foreign_key : true|

### Association
- belongs_to : item
- belongs_to : like

## users_likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null : false, foreign_key : true|
|like_id|references|null : false, foreign_key : true|

### Association
- belongs_to : user
- belongs_to : like

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null : false|
|ancestry|string|

### Association
- has_many : items

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many : items