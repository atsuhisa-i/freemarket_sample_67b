class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id'
  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
  has_many :comments, dependent: :destroy
  has_many :pictures, dependent: :destroy
  has_many :likes, dependent: :destroy
  accepts_nested_attributes_for :pictures
  accepts_nested_attributes_for :category
  accepts_nested_attributes_for :brand
  enum trading_status: { selling: 0, sold: 1 }
end
