5.times do |i|
  CustomerVisitHistory.create!(visit_datetime: "2023-11-#{19 + i} 13:48:08", customer_id: 4)
end

10.times do |i|
  CustomerVisitHistory.create!(visit_datetime: "2023-11-#{19 - i} 13:48:08", customer_id: 5)
end