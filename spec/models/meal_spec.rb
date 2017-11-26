require 'rails_helper'

RSpec.describe Meal, type: :model do
  it { should have_many(:order_items) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
end
