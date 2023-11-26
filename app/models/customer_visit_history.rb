class CustomerVisitHistory < ApplicationRecord
  has_many :selected_menu_snapshots, dependent: :destroy
  belongs_to :customer

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
end
