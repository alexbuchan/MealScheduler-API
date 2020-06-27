class FoodEvent < ApplicationRecord
  acts_as :event
  belongs_to :recipe
end
