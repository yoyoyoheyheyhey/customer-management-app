FactoryBot.define do
  factory :admin do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { 'password123' }

    encrypted_password { Devise::Encryptor.digest(Admin, password) }
  end
end