require 'rails_helper'

describe MeasureUnit do
  subject { FactoryBot.create(:measure_unit) }

  describe 'associations' do
    it { should have_many(:recipe_ingredients).class_name('RecipeIngredient') }
    it { should have_and_belong_to_many(:measure_systems).class_name('MeasureSystem') }
    it { should belong_to(:measure_unit_type).class_name('MeasureUnitType') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end