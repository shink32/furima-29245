FactoryBot.define do
  factory :item do
    name            {Faker::Name.initials(number: 2)}
    price           {'1000'}
    comment         {'あああ'}

    sales_status_id   {'2'}
    category_id       {'2'}
    shipping_fee_status_id {'2'}
    prefecture_id          {'2'}
    scheduled_delivery_id  {'2'}

    user_id  {'1'}

  end
end
