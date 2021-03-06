FactoryBot.define do
  factory :order do
    number      { '4242424242424242' }
    exp_month   { '3' }
    exp_year    { '23' }
    cvc         { '123' }

    postal_code     { '100-0000' }
    prefecture_id   { '2' }
    city            { '長野市' }
    addresses       { '吉田' }
    phone_number    { '00000000000' }
  end
end
