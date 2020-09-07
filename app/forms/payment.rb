class Payment 

  include ActiveModel::Model
  attr_accessor :number, :exp_month, :exp_year, :cvc, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :order, :user_id, :item_id, :token


  def save
    
    user = User.create
    item = Item.create
    
    Order.create(user_id: user.id, item_id: item.id)

    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order_id)
  end

end