FactoryBot.define do
  factory :menu do
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price }
  end
end
