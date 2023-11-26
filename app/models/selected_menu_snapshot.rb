class SelectedMenuSnapshot < ApplicationRecord
  belongs_to :customer_visit_history
  belongs_to :menu

  validates :customer_visit_history_id, uniqueness: { scope: :menu_id  }
end
