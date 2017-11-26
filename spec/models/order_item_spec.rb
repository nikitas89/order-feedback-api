require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe "Associations" do
    it { should belong_to(:meal) }
    it { should belong_to(:delivery_order) }
  end
  describe "Validations" do
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:unit_price) }
  end
end
