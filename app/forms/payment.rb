class Payment 

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :order, :user_id, :item_id, :token, :price


  def save
    
    # user = User.create
    # item = Item.create
    # order = Order.create
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end

end


