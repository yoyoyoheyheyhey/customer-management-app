require 'rails_helper'

RSpec.describe CustomerVisitHistory, type: :model do
    it { should belong_to(:customer) }
    it { should have_many(:selected_menu_snapshots).dependent(:destroy) }
  
    it { should validate_presence_of(:visit_datetime) }
  
    it { should accept_nested_attributes_for(:selected_menu_snapshots).allow_destroy(true) }
  
    describe '#create_selected_menu_snapshot' do
      pending
    end
  
    describe '#update_selected_menu_snapshot' do
      pending
    end
  
    describe '.ransackable_attributes' do
      it '正しい属性の配列を返すこと' do
        expect(CustomerVisitHistory.ransackable_attributes).to match_array(["created_at", "customer_id", "id", "updated_at", "visit_datetime"])
      end
    end
end
