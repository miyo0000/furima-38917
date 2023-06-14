FactoryBot.define do
  factory :item do
    name { 'あ' }
    detail { 'あ' }
    category_id { 1 }
    condition_id { 1 }
    delivery_charge_id { 1 }
    prefecture_id { 1 }
    handling_time_id { 1 }
    price { 1000 }

    association :user
  end
end
