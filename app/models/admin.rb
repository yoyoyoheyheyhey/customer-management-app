class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "name", "password_digest", "updated_at"]
  end
end