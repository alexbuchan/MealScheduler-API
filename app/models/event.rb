# frozen_string_literal: true

# Event
class Event < ApplicationRecord
  belongs_to :user
  belongs_to :eventable, polymorphic: true, dependent: :destroy

  validates :title, :date, :begin_at, :end_at, presence: true
  validates :title, length: { minimum: 3 }
  validate :date_not_in_past?, on: :create
  validate :begin_at_not_in_end_at_future?, on: :create
  validate :end_at_not_in_past_or_begin_at_past?, on: :create

  def event_type
    eventable.class.to_s
  end

  private

  def date_not_in_past?
    errors.add(:date, "Can't be in the past") if date.past?
  end

  def begin_at_not_in_end_at_future?
    errors.add(:begin_at, "Can't be in your end at's future") if begin_at > end_at
  end

  def end_at_not_in_past_or_begin_at_past?
    errors.add(:end_at, "Can't be in your begin at's past") if end_at < begin_at
  end
end
