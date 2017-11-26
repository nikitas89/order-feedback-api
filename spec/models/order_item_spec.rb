require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  it { should belong_to(:meal) }
  it { should belong_to(:delivery_order) }
  it { should validate_presence_of(:quantity) }
  it { should validate_presence_of(:unit_price) }
end
