require 'rails_helper'

describe Ingredient do
  subject { FactoryBot.create(:ingredient) }

  describe 'associations' do
    it { should have_many(:recipe_ingredients).class_name('RecipeIngredient') }
    it { should have_many(:recipes).through(:recipe_ingredients) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
