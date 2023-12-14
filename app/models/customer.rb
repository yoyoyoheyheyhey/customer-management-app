class Customer < ApplicationRecord
  include Discard::Model
  has_many_attached :image 
  has_many :customer_visit_histories, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :phone_number, length: { maximum: 25 }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "phone_number", "remarks", "updated_at"]
  end
end
