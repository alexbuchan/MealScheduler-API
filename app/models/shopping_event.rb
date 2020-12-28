# frozen_string_literal: true

# ShoppingEvent
class ShoppingEvent < ApplicationRecord
  include Eventable
  belongs_to :date_frequency
  has_and_belongs_to_many :recipes, join_table: 'shopping_events_recipes'

  validates_associated :recipes
end
