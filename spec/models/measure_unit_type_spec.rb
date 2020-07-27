require 'rails_helper'

describe MeasureUnitType do
  subject { FactoryBot.create(:measure_unit_type) }

  describe 'associations' do
    it { should have_many(:measure_units).class_name('MeasureUnit') }
  end

  describe 'validations' do
    it { should validate_presence_of(:unit_type) }
  end
end
