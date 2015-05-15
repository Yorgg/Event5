class Event < ActiveRecord::Base
  has_many :event_attendings, :foreign_key => :attended_event_id
  has_many :attendees, :through => :event_attendings, :source => :event_attendee 
  belongs_to :creator, :class_name => "User"

  VALID_DATE_FORMAT = /\A2\d\d\d-[01]\d-[0-3]\d\Z/
  VALID_TIME_FORMAT = /\A[0-2]\d:[0-5]\d\Z/
  validates :time,  presence: true, format: { with: VALID_TIME_FORMAT }
  validates :starts_at,  presence: true, format: { with: VALID_DATE_FORMAT }
  validates :title,  presence: true, length: { maximum: 20 }

 

  scope :starts_after, ->(time) { where("starts_at >= ?", time) }
  scope :starts_before, ->(time) { where("starts_at < ?", time) }
end
