FactoryBot.define do
  factory :order do
    post_code     { '123-4567' }
    prefecture_id    { 13 }
    city          { '横浜市緑区' }
    address       { '青山1-1' }
    phone_number  { '09011112222' }
  
    user_id       { 1 }
    item_id       { 1 }

    

  end
end
