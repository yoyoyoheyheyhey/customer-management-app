require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_length_of(:name).is_at_most(50) }
  it { should validate_length_of(:phone_number).is_at_most(25) }
end
