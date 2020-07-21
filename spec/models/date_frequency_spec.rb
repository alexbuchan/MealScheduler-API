require 'rails_helper'

describe DateFrequency do
  subject { FactoryBot.create(:date_frequency) }

  describe 'associations' do
    it { should have_many(:shopping_events).class_name('ShoppingEvent') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end