require 'rails_helper'

RSpec.describe SelectedMenuSnapshot, type: :model do  
  it { should belong_to(:customer_visit_history) }
  it { should belong_to(:menu) }


  describe "Verification of uniqueness" do
    let(:customer) { create(:customer) }
    let(:customer_visit_history) { create(:customer_visit_history, customer: customer) }
    let(:menu) { create(:menu) }

    subject { build(:selected_menu_snapshot, customer_visit_history: customer_visit_history, menu: menu) }
    it { should validate_uniqueness_of(:customer_visit_history_id).scoped_to(:menu_id) }
  end
end
