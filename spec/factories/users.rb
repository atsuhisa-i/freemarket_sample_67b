FactoryBot.define do
  
  factory :user do
    email {"freemarket@gmail.com"}
    password {'00000000'}
    nickname {Faker::Name.name}
    first_name {"太郎"}
    family_name {"田中"}
    first_name_kana {"タロウ"}
    family_name_kana {"タナカ"}
    birth_day {Date.new(2000,1,18)}
  end
end