FactoryBot.define do
  factory :donation_address do
    post_code { '123-4567' }
    prefecture_id { 13 }
    city          { '横浜市緑区' }
    address       { '青山1-1' }
    phone_number  { '09011112222' }
    building      { 'マンション' }

    token { 'abcd1234' }

    

  end
end
