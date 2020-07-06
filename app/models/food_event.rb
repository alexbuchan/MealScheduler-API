class FoodEvent < ApplicationRecord
  belongs_to :event, dependent: :destroy
  belongs_to :recipe
end
