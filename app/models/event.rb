class Event < ApplicationRecord
  actable
  belongs_to :user
  belongs_to :event_type
end
