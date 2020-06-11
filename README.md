# README
接続先

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
- has_many : likes, dependent: :destroy
- has_many : buy_items, class_name: 'Transaction', :foreign_key => 'buyer_id'
- has_many : sell_items, class_name: 'Transaction', :foreign_key => 'seller_id'

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
|customer_id|string|null : false|
|card_id|string|null : false|

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
- belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id'
- belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
- has_many : comments, dependent: :destroy
- has_many : pictures, dependent: :destroy
- has_many : likes, dependent: :destroy

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

## item_likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null : false, foreign_key : true|
|item_id|references|null : false, foreign_key : true|

### Association
- belongs_to : user
- belongs_to : item

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