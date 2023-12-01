FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    phone_number { Faker::PhoneNumber.phone_number }
    remarks { Faker::Lorem.sentences(number: 3).join(' ') }    
  end
end
