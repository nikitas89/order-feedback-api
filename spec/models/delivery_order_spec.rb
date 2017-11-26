require 'rails_helper'

RSpec.describe DeliveryOrder, type: :model do
  it { should have_many(:order_items) }
  it { should validate_presence_of(:order_id) }
  it { should validate_presence_of(:serving_datetime) }
end

#check that delivery_order_id is unique
#check that delivery_order_id 2 is following GOXXX pattern.
