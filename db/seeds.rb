# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
OrderItem.destroy_all
Meal.destroy_all
DeliveryOrder.destroy_all

#seed meals
10.times do
  Meal.create(
    name: Faker::Food.dish,
    description: Faker::Food.ingredient + " and "+ Faker::Food.ingredient + " with "+ Faker::Food.spice + "."
  )
end

#seed delivery_orders with vanity ID 5 times
num = 120
str = "GO"
5.times do
  num +=1
  order_id = str + num.to_s
DeliveryOrder.create(
  order_id:   order_id,
  serving_datetime: Faker::Time.forward(3)
)
end

#seed orders_items random number of times(1-5) for each DeliveryOrder
DeliveryOrder.all.ids.each do |item|
reps = 1 + Random.rand(5)
  reps.times do
    n = OrderItem.new
    n.meal_id = Meal.all.sample.id
    n.delivery_order_id = item
    n.quantity = 1 + Random.rand(5)
    n.unit_price = 500 + Random.rand(1000)
    n.save
  end
end
