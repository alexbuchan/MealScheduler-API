class Event < ApplicationRecord
  actable
  belongs_to :user

  def to_s
    "id: #{id}\n user_id: #{user_id}\nTitle: #{title}\nComments: #{comments}"
  end
end
