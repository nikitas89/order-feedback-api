require 'rails_helper'

RSpec.describe Meal, type: :model do
  it { should have_many(:order_items) }
end
