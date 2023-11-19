class CustomerVisitHistory < ApplicationRecord
  belongs_to :customer

  validates :visit_datetime, presence: true
end
