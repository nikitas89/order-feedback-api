FactoryBot.define do
factory :delivery_order do |f|
  f.order_id "GO999"
  f.serving_datetime { Faker::Time.forward(3) }
end

end
