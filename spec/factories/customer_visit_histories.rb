FactoryBot.define do
  factory :customer_visit_history do
    visit_datetime { "2023-11-19 13:48:08" }
    customer { nil }
  end
end
