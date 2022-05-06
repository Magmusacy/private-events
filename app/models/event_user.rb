class EventUser < ApplicationRecord
  belongs_to :attendee, foreign_key: 'user_id', class_name: 'User'
  belongs_to :event
end
