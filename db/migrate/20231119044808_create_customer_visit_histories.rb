class CreateCustomerVisitHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_visit_histories do |t|
      t.datetime :visit_datetime
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
