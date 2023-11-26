class AddUniqueToSelectedMenuSnapshot < ActiveRecord::Migration[7.0]
  def change
    add_index :selected_menu_snapshots, [:customer_visit_history_id, :menu_id], unique: true, name: 'index_snapshots_on_customer_visit_history_id_and_menu_id'
  end
end
