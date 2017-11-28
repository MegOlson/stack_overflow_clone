require 'rails_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_confirmation_of :password }
  it 'will have an admin value of false when created' do
    user = FactoryBot.create(:user)
    user.is_admin?.should eq false
  end
end
