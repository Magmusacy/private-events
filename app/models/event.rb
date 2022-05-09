class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendings, class_name: 'EventAttending'
  has_many :attendees, through: :event_attendings, source: :attendee

  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date > ?', Date.today) }
end
