class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :credit_card, dependent: :destroy
  has_one :deliver_address, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :buy_items, class_name: 'Transaction', :foreign_key => 'buyer_id'
  has_many :sell_items, class_name: 'Transaction', :foreign_key => 'seller_id'
  
  validates :nickname, :email, :password, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day, presence: true
  validates :family_name, :first_name, :family_name_kana, :first_name_kana, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, format: {with: /\A[a-z\d]{7,}+\z/i}
end
