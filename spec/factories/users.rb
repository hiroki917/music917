FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 2) }
    age                   {   1  }
    first_name            { '小柳津' }
    last_name             { '洋毅' }
    first_name_kana       { 'オヤイヅ' }
    last_name_kana        { 'ヒロキ' }
    birth_day             { '1986-09-17' }
    email                 { Faker::Internet.free_email }
    password              { '1abcde' }
    password_confirmation { password }
  end
end