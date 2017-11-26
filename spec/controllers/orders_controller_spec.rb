require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  describe 'GET #index' do
    before { get :index }
    it { should respond_with(200) }
  end

  # describe 'GET #show' do
  #   before { get :show, params: { id: 7 } }
  #   it { should respond_with(200) }
  # end

# end

# RSpec.describe OrdersController do
  it { should route(:get, '/orders').to(action: :index, format: :json) }
  it { should route(:get, '/orders/10').to(action: :show, id: 10, format: :json) }

  it "returns JSON-formatted content" do
    get :index, format: :json
    expect(response.header['Content-Type']).to include 'application/json'
  end

end
