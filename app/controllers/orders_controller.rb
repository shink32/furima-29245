class OrdersController < ApplicationController
  def index
    # @order = Order.all

    @item = Item.find(params[:item_id])
  end

  def new
     @order = Payment.new #paymentに編集
  end


  def create
    @order = Order.new(price: order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end

    @orders = Payment.new(order_params)
    @orders.save


  end


  private

  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
