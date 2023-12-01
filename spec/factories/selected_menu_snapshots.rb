FactoryBot.define do
  factory :selected_menu_snapshot do
    name_at_time { Faker::Commerce.product_name }
    price_at_time { Faker::Commerce.price }
    customer_visit_history { nil }
    menu { nil }
  end
end
