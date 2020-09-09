class OrdersController < ApplicationController

  before_action :move_to_sign_in
  before_action :move_to_top

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])

  end

  def new
     @order = Payment.new #paymentに 編集
  end


  def create

    @item = Item.find(params[:item_id])
    @order = Payment.new(order_params)
    if @order.valid?

      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end

  end

  private

  def order_params
    params.permit( :price, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token,:item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def move_to_sign_in
  unless user_signed_in?
    redirect_to new_user_session_path
  end
end

def move_to_top
  @item = Item.find(params[:item_id])
  if current_user.id == @item.user_id
    redirect_to items_path
  end
end





end
