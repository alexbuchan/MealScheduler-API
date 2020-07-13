# frozen_string_literal: true

# DateFrequency
class DateFrequency < ApplicationRecord
  has_many :shopping_events
  validates :name, presence: true
end
