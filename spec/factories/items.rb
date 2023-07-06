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

    user { FactoryBot.create(:user) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')

    end

  end
end
