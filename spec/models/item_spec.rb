require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能'
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  it '画像がないと登録できない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")

  end

  it '商品名が必須であること' do
    @item.name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end

  it '商品の説明が必須であること' do
    @item.comment = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Comment can't be blank")
  end

  it 'カテゴリーの情報が必須であること' do
    @item.category_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
  end

  it '商品の状態についての情報が必須であること' do
    @item.sales_status_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Sales status can't be blank", "Sales status is not a number")
  end

  it '配送料の負担についての情報が必須であること' do
    @item.shipping_fee_status_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping fee status can't be blank", "Shipping fee status is not a number")
  end

  it '発送元の地域についての情報が必須であること' do
    @item.prefecture_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
  end

  it '発送までの日数についての情報が必須であること' do
    @item.scheduled_delivery_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank", "Scheduled delivery is not a number")
  end

  it '価格についての情報が必須であること' do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank", "Price は半角数字で入力してください。", "Price is out of setting range")
  end

  it '価格の範囲が、¥300~¥9,999,999の間であること' do
    @item.price = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is out of setting range")
  end

  it '販売価格は半角数字のみ入力可能であること' do
    @item.price = "１１１"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price は半角数字で入力してください。")
  end

end
