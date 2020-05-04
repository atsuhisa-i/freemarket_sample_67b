FactoryBot.define do
  
  factory :item do
    buyer             {create(:user)}
    seller            {create(:user)}
    name              {"Tシャツ"}
    explanation       {"貴重です"}
    size              {"M"}
    category
    brand
    condition         {"新品、未使用"}
    postage_payer     {1}
    shipping_origin   {"東京"}
    days_to_ship      {"1~2日で発送"}
    price             {6000}
    trading_status    {0}
  end
end
