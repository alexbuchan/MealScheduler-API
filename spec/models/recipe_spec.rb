require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject { FactoryBot.create(:recipe) }

  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:measure_system).class_name('MeasureSystem') }
    it { should have_many(:food_events).class_name('FoodEvent') }
    it { should have_many(:recipe_ingredients).class_name('RecipeIngredient') }
    it { should have_many(:ingredients).through(:recipe_ingredients) }
    it { should have_and_belong_to_many(:shopping_events).class_name('ShoppingEvent') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:steps) }
    it { should validate_presence_of(:preparation_time) }
    it { should validate_presence_of(:cooking_time) }
    it { should validate_presence_of(:difficulty) }
    it { should validate_presence_of(:measure_system) }
  end

  describe '#as_json' do
    it 'returns the correct attributes in json format' do
      attributes = [:id, :name, :steps, :preparation_time, :cooking_time, :difficulty, :measure_system, :comments, :user_id, :created_at, :updated_at, :recipe_ingredients]
      expect(subject.as_json.symbolize_keys.keys).to eq(attributes)
    end
  end
end
