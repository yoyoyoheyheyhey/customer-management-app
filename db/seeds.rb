Admin.create!(
  name: "上田 大輔",
  email: "ueda@sample.com",
  password: "password",
  password_confirmation: "password"
)

5.times do |i|
  Admin.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
  )
end

remarks = [
  "ボブカット希望。ダークブラウンのカラー、敏感肌用製品を使用。",
  "アンモニアフリーのカラー必須。今回は明るめのアッシュブロンドを希望。",
  "6ヶ月後に縮毛矯正の予約あり。前回のトリートメントを再使用希望。",
  "敏感な頭皮。低刺激のシャンプーとトリートメント、低温ドライを要求。",
  "強めのパーマ希望。髪の保護処理を重視。"
]
5.times do |i|
  Customer.create!(
    name: Faker::Name.name,
    phone_number: "080#{8.times.map { rand(9) }.join}",
    remarks: remarks[i]
  )
end

services = [
  {
    name: "カット",
    price: 3000
  },
  {
    name: "カラーリング",
    price: 8000
  },
  {
    name: "パーマ",
    price: 10000
  },
  {
    name: "トリートメント",
    price: 3000
  },
  {
    name: "ヘッドスパ",
    price: 3000
  },
]
services.each do |service|
  Menu.create!(
    name: service[:name],
    price: service[:price]
  )
end

customer_ids = Customer.pluck(:id)
customer_ids.each do |customer_id|
  CustomerVisitHistory.create!(
    visit_datetime: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all),
    customer_id: customer_id
  )
end

menu_ids = Menu.pluck(:id)
customer_visit_history_ids = CustomerVisitHistory.pluck(:id).reverse
5.times do |i|
  menu = Menu.find(menu_ids[i])
  customer_visit_history_id = CustomerVisitHistory.find(customer_visit_history_ids[i])
  SelectedMenuSnapshot.create!(
    name_at_time: menu.name,
    price_at_time: menu.price,
    customer_visit_history_id: customer_visit_history_id.id,
    menu_id: menu.id
  )
end