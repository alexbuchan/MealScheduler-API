require 'rails_helper'

describe EventType do
  subject { FactoryBot.create(:event_type) }

  describe 'associations' do
    it { should have_many(:events).class_name('Event') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
