class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_sign_in, except: [:index, :show]

  def index
    @items = Item.all.order(id: 'DESC')

    @orders = Order.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :price, :comment, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id).merge(user_id: current_user.id)
  end

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

end
