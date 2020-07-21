require 'rails_helper'

describe Ingredient do
  subject { FactoryBot.create(:ingredient) }
  
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    describe 'name' do
      context 'when name is NOT present' do
        it 'is NOT valid' do
          subject.name = nil
          expect(subject).to_not be_valid
        end
      end

      context 'when name is present' do
        it 'is valid' do
          subject.name = 'ham'
          expect(subject).to be_valid
        end
      end
    end
  end
end