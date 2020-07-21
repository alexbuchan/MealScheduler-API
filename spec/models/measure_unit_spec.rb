require 'rails_helper'

describe MeasureUnit do
  subject { FactoryBot.create(:measure_unit) }

  describe 'associations' do
    it { should have_and_belong_to_many(:measure_systems).class_name('MeasureSystem') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
