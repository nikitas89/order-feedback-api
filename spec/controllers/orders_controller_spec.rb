require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe 'GET #index' do
    before { get :index }
    it { should respond_with(200) }
  end

  it "returns JSON-formatted content" do
    get :index, format: :json
    expect(response.header['Content-Type']).to include 'application/json'
  end

  describe 'GET #show' do
    before { get :show, params: { id: create(:delivery_order) } }
    it { should respond_with(200) }
  end

  it "returns JSON-formatted content" do
    get :index,  params: { id: create(:delivery_order) }, format: :json
    expect(response.header['Content-Type']).to include 'application/json'
  end

  it { should route(:get, '/orders').to(action: :index, format: :json) }
  it { should route(:get, '/orders/2').to(action: :show, id: 2, format: :json) }

end
