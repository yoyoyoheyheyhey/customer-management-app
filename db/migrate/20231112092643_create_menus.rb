class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.bigint :price, null: false

      t.timestamps
    end
  end
end
