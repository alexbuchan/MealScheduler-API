class Event < ApplicationRecord
  actable
  belongs_to :user
end
