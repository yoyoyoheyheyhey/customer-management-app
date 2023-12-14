class AddDiscardedToAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :discarded_at, :datetime
    add_index :admins, :discarded_at
  end
end
