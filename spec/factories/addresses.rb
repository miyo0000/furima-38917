FactoryBot.define do
  factory :address do
    post_code     { '123-4567' }
    prefecture    { 13 }
    city          { '横浜市緑区' }
    address       { '青山1-1' }
    phone_number  { '09011112222' }

    user { 1 }
  end
end
