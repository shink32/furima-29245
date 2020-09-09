FactoryBot.define do
  factory :payment do
    token           { '123' }
    postal_code     { '100-0000' }
    prefecture_id   { '2' }
    city            { '長野市' }
    addresses       { '吉田' }
    phone_number    { '00000000000' }
    association :user
    association :item
  end
end
