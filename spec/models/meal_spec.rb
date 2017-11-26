require 'rails_helper'

RSpec.describe Meal, type: :model do
  describe "Associations" do
    it { should have_many(:order_items) }
  end
  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end
end
