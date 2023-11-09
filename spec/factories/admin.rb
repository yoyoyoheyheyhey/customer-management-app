#
# Table name:   admins
# 
# id                :bigint    null: false   PK
# name              :string    null: false
# email             :string    null: false   unique:true
# password_digest   :string    null: false
# created_at        :datetime  null: false   precision: 6
# updated_at        :datetime  null: false   precision: 6


FactoryBot.define do
  factory :admin do
    name { "admin" }
    email { "admin@xxx.com" }
    password_digest { "admin_password" }
  end
end