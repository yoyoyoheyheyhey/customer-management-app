require 'rails_helper'

RSpec.describe Menu, type: :model do
  it { is_expected.to have_many(:selected_menu_snapshots) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:price) }

  describe '.ransackable_attributes' do
    it 'returns an array of ransackable attributes' do
      expect(Menu.ransackable_attributes).to eq(["created_at", "id", "name", "price", "updated_at"])
    end
  end
end
