FactoryBot.define do
  factory :user do
    nickname              { 'a' }
    password              { '000aaa' }
    password_confirmation { password }
    family_name { '田中' }
    first_name { '花子' }
    family_name_kana { 'タナカ' }
    first_name_kana       { 'ハナコ' }
    birth_day             { '1960-01-01' }

    email { Faker::Internet.unique.email }
  end
end
