class OrderItem < ApplicationRecord
  belongs_to :meal, optional: true
  belongs_to :delivery_order, optional: true

  def as_json(options={})
    super(include: [:meals],
      except: [:id, :created_at,:delivery_order_id, :updated_at]
    )
  end

end
