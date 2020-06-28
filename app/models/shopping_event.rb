class ShoppingEvent < ApplicationRecord
  acts_as :event
  has_and_belongs_to_many :recipes, join_table: 'shopping_events_recipes'
end
