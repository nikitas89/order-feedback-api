class DeliveryOrder < ApplicationRecord
  has_many :order_items
  validates_presence_of :order_id, :serving_datetime
  validates_uniqueness_of :order_id

  def delivery_date
    str = serving_datetime.to_s[0,10]
    "#{str}"
  end

  def delivery_time
    # format: "11:00–11:30AM" #"11:30–12:00AM"
    t = serving_datetime
    # puts t.strftime("%I, %p, %M")
    hr = t.strftime("%I").to_i
    min = t.strftime("%M").to_i
    meridian=t.strftime("%p")
    trailing_min = ""
    hrs_display =""
    if min<31
      trailing_min = "#{hr}:00–#{hr}:30"
      hrs_display  = trailing_min << meridian
    elsif hr<12
      trailing_min = "#{hr}:30–#{hr+1}:00"
      hrs_display  = trailing_min << meridian
    else
      trailing_min = "12:30–1:00"
        hrs_display  = trailing_min << "PM"
    end
    # puts hrs_display
    "#{hrs_display}"
  end
  #
  # def as_json(options={})
  # super(only: :order_id,
  #   methods: [:delivery_date, :delivery_time])
  # end
  #
  #
    # def as_json(options={})
    # super(  only: :order_id, methods: [:delivery_date, :delivery_time],
    #     include: { order_items: {
    #       only: :quantity,
    #       methods: [:total_price, :mealName]
    #     }})
    # end

end
