# frozen_string_literal: true

# FoodEvent
class FoodEvent < ApplicationRecord
  include Eventable

  has_and_belongs_to_many :recipes, join_table: 'food_events_recipes'

  validates_associated :recipes
end
