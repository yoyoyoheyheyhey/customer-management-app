class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :icon

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, uniqueness: true, length: { minimum: 8 }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "name", "password_digest", "updated_at"]
  end
end