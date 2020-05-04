FactoryBot.define do
  
  factory :user do
    email {Faker::Internet.free_email}
    password {'12345678'}
    nickname {Faker::Name.name}
    first_name {Faker::Name.last_name}
    family_name {Faker::Name.first_name}
    first_name_kana {"アイウエオ"}
    family_name_kana {"カキクケコ"}
    birth_year {Date.new(2000,1,18)}
    birth_month {Date.new(2000,1,18)}
    birth_day {Date.new(2000,1,18)}
  end
end