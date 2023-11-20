# == Schema Information ==
#
# Table name:   admins
# 
# id                :bigint    null: false   PK
# name              :string    null: false
# email             :string    null: false   unique:true
# password_digest   :string    null: false
# created_at        :datetime  null: false   precision: 6
# updated_at        :datetime  null: false   precision: 6

class Admin < ApplicationRecord
  has_secure_password
  has_one_attached :icon

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, uniqueness: true, length: { minimum: 8 }
end