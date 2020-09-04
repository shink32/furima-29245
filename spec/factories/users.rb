FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '0000000a' }
    password_confirmation { '0000000a' }
    first_name            { '晋三' }
    last_name             { '安倍' }
    first_name_kana       { 'シンゾウ' }
    last_name_kana        { 'アベ' }
    birth_date            { '1900/1/1' }
  end
end
