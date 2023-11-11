FactoryBot.define do
  factory :customer do
    name { "customer" }
    phone_number { "08011112222" }
    remarks { "This is customer information created for testing purposes." }    
  end
end
