require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe '商品購入機能'
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.build(:item)
    item.image = fixture_file_upload('public/images/test_image.png')
    @payment = FactoryBot.build(:payment, user_id: user.id, item_id: item.id)
  end

  it 'クレジットカード情報が空だと登録できない' do
    @payment.token = nil
    @payment.valid?
    expect(@payment.errors.full_messages).to include("Token can't be blank")
  end
  it '郵便番号が空だと登録できない' do
    @payment.postal_code = nil
    @payment.valid?
    expect(@payment.errors.full_messages).to include("Postal code can't be blank")
  end
  it '都道府県が空だと登録できない' do
    @payment.prefecture_id = nil
    @payment.valid?
    expect(@payment.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
  end
  it '市町村が空だと登録できない' do
    @payment.city = nil
    @payment.valid?
    expect(@payment.errors.full_messages).to include("City can't be blank")
  end
  it '番地が空だと登録できない' do
    @payment.addresses = nil
    @payment.valid?
    expect(@payment.errors.full_messages).to include("Addresses can't be blank")
  end
  it '電話番号が空だと登録できない' do
    @payment.phone_number = nil
    @payment.valid?
    expect(@payment.errors.full_messages).to include("Phone number can't be blank", 'Phone number はハイフンなし11文字以内でご記入ください')
  end

  it '郵便番号にハイフンがないと登録できない' do
    @payment.postal_code = '1110000'
    @payment.valid?
    expect(@payment.errors.full_messages).to include('Postal code は7桁、ハイフンを入れてください')
  end
  it '電話番号はハイフンが必要で、11桁以内でないと登録できない' do
    @payment.phone_number = '123456789123'
    @payment.valid?
    expect(@payment.errors.full_messages).to include('Phone number はハイフンなし11文字以内でご記入ください')
  end

  it '発送元の地域idが1では登録できないこと' do
    @payment.prefecture_id = 1
    @payment.valid?
    expect(@payment.errors.full_messages).to include('Prefecture must be other than 1')
  end

  it '上記全ての項目があれば、登録できる' do
    expect(@payment).to be_valid
  end
end
