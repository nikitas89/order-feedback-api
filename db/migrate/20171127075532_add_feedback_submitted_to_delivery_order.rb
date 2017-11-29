class AddFeedbackSubmittedToDeliveryOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :delivery_orders, :feedback_submitted, :boolean, default: false
  end
end
