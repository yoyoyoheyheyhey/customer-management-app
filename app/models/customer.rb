# == Schema Information ==
#
# Table name:   customers
# 
# id                :bigint    null: false   PK
# name              :string    null: false
# phone_number      :string    null: false
# remarks           :string
# created_at        :datetime  null: false   precision: 6
# updated_at        :datetime  null: false   precision: 6

class Customer < ApplicationRecord
  has_one_attached :avatar

  validates :name, presence: true, length: { maximum: 50 }
  validates :phone_number, presence: true, length: { maximum: 25 }
end
