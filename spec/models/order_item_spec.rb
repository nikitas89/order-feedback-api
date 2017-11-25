require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  it { should belong_to(:meal) }
  it { should belong_to(:delivery_order) }
end
