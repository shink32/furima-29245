require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入機能'
  before do
  end

  it 'クレジットカード情報が空だと登録できない' do
  end
  it '郵便番号が空だと登録できない' do
  end
  it '都道府県が空だと登録できない' do
  end
  it '市町村が空だと登録できない' do
  end
  it '番地が空だと登録できない' do
  end
  it '電話番号が空だと登録できない' do
  end

  it '郵便番号にハイフンがないと登録できない' do
  end
  it '電話番号はハイフンが必要で、11桁以内でないと登録できない' do
  end
end
