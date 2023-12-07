require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'associations' do
    it { should have_many(:customer_visit_histories).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(50) }

    it { should validate_presence_of(:phone_number) }
    it { should validate_length_of(:phone_number).is_at_most(25) }
  end

  describe 'associations' do
    it { should have_many_attached(:image) }
  end

  describe '.ransackable_attributes' do
    it 'returns the correct array of attributes' do
      expect(Customer.ransackable_attributes).to eq(["created_at", "id", "name", "phone_number", "remarks", "updated_at"])
    end
  end
end
