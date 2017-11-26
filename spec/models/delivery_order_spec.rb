require 'rails_helper'

RSpec.describe DeliveryOrder, type: :model do
  describe "Associations" do
    it { should have_many(:order_items) }
  end
  describe "Validations" do
    it { should validate_presence_of(:order_id) }
    it { should validate_presence_of(:serving_datetime) }
    it { should validate_uniqueness_of(:order_id) }
  end
end
