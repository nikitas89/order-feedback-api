class DeliveryOrder < ApplicationRecord
  has_many :order_items
  # datetime = serving_datetime.split(' ')
  # date = datetime[0]
  def delivery_date
    str = serving_datetime.to_s[0,10]
    "#{str}"
  end

  def delivery_time
    str = serving_datetime.to_s.split(' ')[1]
    "#{str}"
    # "#{serving_datetime}"
  end

  def as_json(options={})
    super(except: [:created_at,:serving_datetime, :updated_at],
    methods: [:delivery_date, :delivery_time])
  end

end
