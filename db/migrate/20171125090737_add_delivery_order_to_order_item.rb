class AddDeliveryOrderToOrderItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :order_items, :delivery_order, foreign_key: true
  end
end
