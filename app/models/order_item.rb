class OrderItem < ApplicationRecord
  belongs_to :meal
  belongs_to :delivery_order
  has_one :feedback, as: :ratable_type 
  validates_presence_of :quantity,:unit_price


  def total_price
    total = quantity* unit_price
    "#{total}"
  end

  def name
    name = meal.name
    "#{name}"
  end

end
