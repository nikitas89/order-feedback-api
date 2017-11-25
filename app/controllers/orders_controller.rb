class OrdersController < ApplicationController
    def index
      render json: DeliveryOrder.all
    end
    def show
      render json: DeliveryOrder.find(params[:id])
    end
  
end
