class Item < ApplicationRecord
  belongs_to :user
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id', optional: true
  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
  belongs_to :category
  belongs_to :brand, optional: true
  has_many :comments, dependent: :destroy
  has_many :pictures, dependent: :destroy
  has_many :likes, dependent: :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true
  accepts_nested_attributes_for :brand, allow_destroy: true
  enum trading_status: { selling: 0, sold: 1 }

  validates_associated :pictures
  
  validates :name, presence: true, length: {maximum: 40}
  validates :explanation, presence: true, length: {maximum: 1000}
  validates :size, :category, :condition, :postage_payer, :shipping_origin, :days_to_ship, :trading_status, presence: true, exclusion: {in: ["選択してください"]}
  validates :price, presence: true, numericality: {greater_than: 299, less_than: 10000000}
  validates :pictures, presence: true
end
