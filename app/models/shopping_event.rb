# frozen_string_literal: true

# ShoppingEvent
class ShoppingEvent < ApplicationRecord
  belongs_to :event, dependent: :destroy
  belongs_to :date_frequency
  has_and_belongs_to_many :recipes, join_table: 'shopping_events_recipes'
end
