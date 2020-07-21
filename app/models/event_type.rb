# frozen_string_literal: true

# EventType
class EventType < ApplicationRecord
  has_many :events

  validates :name, presence: true, uniqueness: true
end
