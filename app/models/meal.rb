class Meal < ApplicationRecord
    has_many :order_items
    validates_presence_of :name,:description
    #
    # def as_json(options={})
    #   super(
    #   {  only: [:name]}.merge(options || {})
    #   )
    # end
    # def name
    #   meal_name = name
    #   "#{meal_name}"
    # end

end
