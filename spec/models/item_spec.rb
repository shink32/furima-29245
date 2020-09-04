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
    binding.pry

  end

  it '商品名が必須であること' do
  end

  it '商品の説明が必須であること' do
  end

  it 'カテゴリーの情報が必須であること' do
  end

  it '商品の状態についての情報が必須であること' do
  end

  it '配送料の負担についての情報が必須であること' do
  end

  it '発送元の地域についての情報が必須であること' do
  end

  it '発送までの日数についての情報が必須であること' do
  end

  it '価格についての情報が必須であること' do
  end

  it '価格の範囲が、¥300~¥9,999,999の間であること' do
  end

  it '販売価格は半角数字のみ入力可能であること' do
  end



end
