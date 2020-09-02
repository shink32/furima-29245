class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash [
     :category,
     :sales_status,
     :shipping_fee_status, 
     :prefecture,
     :scheduled_delivery
    ]


  with_options presence: true do
  validates :category
  validates :sales_status
  validates :shipping_fee_status
  validates :prefecture
  validates :scheduled_delivery
  end

  validates :category,               numericality: { other_than: 1 } 
  validates :sales_status,           numericality: { other_than: 1 } 
  validates :shipping_fee_status_id, numericality: { other_than: 1 } 
  validates :prefecture_id,          numericality: { other_than: 1 } 
  validates :scheduled_delivery_id,  numericality: { other_than: 1 } 

  
end
