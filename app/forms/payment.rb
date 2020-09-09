class Payment
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :order, :user_id, :item_id, :token, :price

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は7桁、ハイフンを入れてください' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'はハイフンなし11文字以内でご記入ください' }
  end
end
