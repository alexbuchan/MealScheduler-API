class ShoppingEvent < ApplicationRecord
  belongs_to :event, dependent: :destroy
  has_and_belongs_to_many :recipes, join_table: 'shopping_events_recipes'
end
