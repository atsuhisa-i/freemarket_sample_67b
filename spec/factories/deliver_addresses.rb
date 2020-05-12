FactoryBot.define do

  factory :deliver_address do
    family_name {"田中"}
    first_name {"太郎"}
    family_name_kana {"アイウエオ"}
    first_name_kana {"カキクケコ"}
    zip_code {"1111111"}
    prefecture {"北海道"}
    municipality {"大宮市"}
    building_name {"1-2-1-302"}
    phone_number {"00000000000"}
  end
end