class DeliveryOrder < ApplicationRecord
  has_many :order_items

  def delivery_date
    str = serving_datetime.to_s[0,10]
    "#{str}"
  end

  def delivery_time
    str = serving_datetime.to_s.split(' ')[1]
    "#{str}"
    # "#{serving_datetime}"
  end
#include: {order_items: include:{meals}}
  def as_json(options={})
    super(include: {order_items:{
                      include: {meal:{only: :name}},
                      only: [:quantity,:unit_price],
                      # do merge from model of meal etc
                      # methods: [:delivery_date, :delivery_time]
                    }
    },

      except: [:id, :created_at,:serving_datetime, :updated_at],
    methods: [:delivery_date, :delivery_time])
  end

end
