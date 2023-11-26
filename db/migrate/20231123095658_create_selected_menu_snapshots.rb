class CreateSelectedMenuSnapshots < ActiveRecord::Migration[7.0]
  def change
    create_table :selected_menu_snapshots do |t|
      t.string :name_at_time
      t.bigint :price_at_time
      t.references :customer_visit_history, null: false, foreign_key: true
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
