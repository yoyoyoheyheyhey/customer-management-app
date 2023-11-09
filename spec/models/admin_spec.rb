require 'rails_helper'

RSpec.describe Admin, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:name).is_at_most(50) }
  it { should validate_length_of(:password_digest).is_at_least(8) }

  describe "Verification of uniqueness" do
    let!(:admin) { FactoryBot.create(:admin) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:password_digest) }
  end

end
