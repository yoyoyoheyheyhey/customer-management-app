FactoryBot.define do
  factory :customer_visit_history do
    visit_datetime { Faker::DateTime.this_month }
    customer { nil }
  end
end
