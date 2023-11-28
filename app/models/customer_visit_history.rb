class CustomerVisitHistory < ApplicationRecord
  has_many :selected_menu_snapshots, dependent: :destroy
  belongs_to :customer
  accepts_nested_attributes_for :selected_menu_snapshots, allow_destroy: true

  validates :visit_datetime, presence: true

  def create_selected_menu_snapshot(menu_ids)
    menu_ids.each do |menu|
      selected_menu_snapshots.create(menu_id: menu.id, name_at_time: menu.name, price_at_time: menu.price)
    end
  end

  def update_selected_menu_snapshot(menu_ids)
    unselected_menu = selected_menu_snapshots.where.not(menu_id: menu_ids)
    unselected_menu.delete_all
    menu_ids.each do |menu|
      selected_menu_snapshots.create(menu_id: menu.id, name_at_time: menu.name, price_at_time: menu.price) unless selected_menu_snapshots.exists?(menu_id: menu)
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "customer_id", "id", "updated_at", "visit_datetime"]
  end
end