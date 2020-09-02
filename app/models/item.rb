class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash [:scheduled_delivery, :shipping_fee_status]


  with_options presence: true do

  validates :scheduled_delivery
  validates :shipping_fee_status

  end

  validates :scheduled_delivery_id, numericality: { other_than: 1 } 
  validates :scheduled_delivery_id, numericality: { other_than: 1 } 
end
