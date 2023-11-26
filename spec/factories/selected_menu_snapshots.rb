FactoryBot.define do
  factory :selected_menu_snapshot do
    name_at_time { "MyString" }
    price_at_time { "" }
    customer_visit_history { nil }
    menu { nil }
  end
end
