require 'rails_helper'

RSpec.describe DeliveryOrder, type: :model do
  it { should have_many(:order_items) }
end
