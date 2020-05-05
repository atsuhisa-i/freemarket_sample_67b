class DeliverAddress < ApplicationRecord
  belongs_to :user, optional: true

  validates :family_name, :first_name, :family_name_kana, :first_name_kana, :zip_code, :prefecture, :municipality, presence: true

  # 文字数制限
  validates :zip_code, length: {in: 7..7}
end
