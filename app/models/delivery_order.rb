class DeliveryOrder < ApplicationRecord
  has_many :order_items
  validates_presence_of :order_id, :serving_datetime
  validates_uniqueness_of :order_id

  def delivery_date
    str = serving_datetime.to_s[0,10]
    "#{str}"
  end

  def delivery_time
    str = serving_datetime.to_s.split(' ')[1]
    "#{str}"
  end
  #
  # def as_json(options={})
  #   super({
  #     only: [:order_id],
  #     methods: [:delivery_date, :delivery_time],
  #     include: [:order_items]
  #   }.merge(options || {}))
  # end

end



# do merge from model of meal etc
# methods: [:delivery_date, :delivery_time]
# def as_json(options={})
#   super(include: {order_items:{
#                     include: {meal:{only: :name}},
#                     only: [:quantity,:unit_price],
#                   }
#                 },
#     only: [:order_id],
#   methods: [:delivery_date, :delivery_time])
# end


# def as_json(options={})
#   super(
# { only: [:order_id],
#   methods: [:delivery_date, :delivery_time],
# include: order_items }.merge(options || {})
# )
# end


#
# include: {order_items:{
#                   only: [:quantity,:unit_price],
#                 }
#               },
