class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash [
     :shipping_fee_status, 
     :prefecture,
     :scheduled_delivery
    ]


  with_options presence: true do
  validates :shipping_fee_status
  validates :prefecture
  validates :scheduled_delivery
  end

  validates :shipping_fee_status_id, numericality: { other_than: 1 } 
  validates :prefecture_id,          numericality: { other_than: 1 } 
  validates :scheduled_delivery_id,  numericality: { other_than: 1 } 


end
