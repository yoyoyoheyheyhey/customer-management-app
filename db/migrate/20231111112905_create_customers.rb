class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :phone_number, null: false
      t.string :remarks

      t.timestamps
    end
  end
end
