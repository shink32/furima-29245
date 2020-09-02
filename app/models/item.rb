class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
  has_one_attached :image


  with_options presence: true do
  validates :category
  validates :sales_status
  validates :shipping_fee_status
  validates :prefecture
  validates :scheduled_delivery
  end

  validates :category_id,            numericality: { other_than: 1 } 
  validates :sales_status_id,        numericality: { other_than: 1 } 
  validates :shipping_fee_status_id, numericality: { other_than: 1 } 
  validates :prefecture_id,          numericality: { other_than: 1 } 
  validates :scheduled_delivery_id,  numericality: { other_than: 1 } 


end
