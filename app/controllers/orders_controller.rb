class OrdersController < ApplicationController
  def index
    render json: DeliveryOrder.all.as_json(
      only: :order_id, methods: [:delivery_date, :delivery_time]
)
  end

    def show
      render json: DeliveryOrder.find(params[:id]).as_json(
        only: :order_id, methods: [:delivery_date, :delivery_time],
          include: { order_items: {
            include: { meal: { only: :name } },
            only: :quantity,
            methods: :total_price
          }}
      )
    end
end
