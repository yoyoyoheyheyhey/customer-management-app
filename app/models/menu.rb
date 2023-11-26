# == Schema Information ==
#
# Table name:   menus
# 
# id                :bigint    null: false   PK
# name              :string    null: false
# price             :string    null: false
# created_at        :datetime  null: false   precision: 6
# updated_at        :datetime  null: false   precision: 6

class Menu < ApplicationRecord
  has_paper_trail
  has_many :selected_menu_snapshots

  validates :name, presence: true
  validates :price, presence: true
end
