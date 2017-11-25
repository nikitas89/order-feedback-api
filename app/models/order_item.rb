class OrderItem < ApplicationRecord
  belongs_to :meal, optional: true
  belongs_to :delivery_order, optional: true 
end
