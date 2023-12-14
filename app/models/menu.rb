class Menu < ApplicationRecord
  include Discard::Model
  has_paper_trail
  has_many :selected_menu_snapshots

  validates :name, presence: true
  validates :price, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "price", "updated_at"]
  end
end
