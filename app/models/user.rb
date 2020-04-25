class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one : credit_card, dependent: :destroy
  has_one : deliver_address, dependent: :destroy
  has_many : items, dependent: :destroy
  has_many : comments, dependent: :destroy
  has_many : likes, dependent: :destroy
  has_many : buy_items
  has_many : sell_items

  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day,presence: true
end
