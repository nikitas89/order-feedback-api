class OrdersController < ApplicationController
  def index
    render json: DeliveryOrder.all
    .as_json(
      only: [:id, :order_id, :feedback_submitted], methods: [:delivery_date, :delivery_time]
    )
  end

    def show
      render json: DeliveryOrder.find(params[:id])
      .as_json(
        only: :order_id,
        methods: [:delivery_date, :delivery_time],
        include: { order_items: {root:false,
                  methods: [:name,:total_price ],
                  only: [:id, :quantity, :meal_id]
          }}
      )
    end

end
