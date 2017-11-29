class FeedbacksController < ApplicationController

  def index
    if params[:order_id] && @delivery_order = DeliveryOrder.find_by_id(params[:order_id])
        @do = DeliveryOrder.find_by_id(params[:order_id])
        @orders_items = @do.order_items
        @do_feedbacks = @do.feedback
        @order_feedbacks = Feedback.where(ratable_type_id: @orders_items)
        @feedbacks = []
        @feedbacks << @do_feedbacks
        @feedbacks << @order_feedbacks
        render json: @feedbacks.as_json()

      else
        # @tags = Tag.order(:name)
    end
  end

  def create
    new_ratable_id = Feedback.last.ratable_id + 1
    Feedback.create(ratable_type_type:'DeliveryOrder', ratable_id:new_ratable_id, ratable_type_id: params[:order_id], comment:params[:delivery])
    if params[:feedbacks].length > 0
      mealFeedbacks = params[:feedbacks]
      mealFeedbacks.each do |comment|
          meal_id  = comment[:id].to_i
          feedback = Feedback.new
          feedback.ratable_id = Feedback.last.ratable_id + 1
          feedback.ratable_type_type = 'OrderItem'
          feedback.ratable_type_id =  meal_id
          feedback.comment = comment[:value]
          feedback.save
        end
    end
  @do =  DeliveryOrder.find(params[:order_id])
  @do.feedback_submitted = true
  @do.save
  render status: 200, json: @controller.to_json

  end


end
