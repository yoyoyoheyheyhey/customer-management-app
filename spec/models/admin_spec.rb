require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:admin) { FactoryBot.create(:admin) }

  describe 'Devise modules' do
    it 'includes necessary devise modules' do
      expect(Admin.devise_modules).to include(
        :database_authenticatable, 
        :registerable, 
        :recoverable, 
        :rememberable, 
        :validatable
      )
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(50) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'associations' do
    it { should have_one_attached(:icon) }
  end

  describe '.ransackable_attributes' do
    it 'returns the correct array of attributes' do
      expect(Admin.ransackable_attributes).to match_array(["created_at", "email", "id", "name", "password_digest", "updated_at"])
    end
  end
end
