class Event < ApplicationRecord
  belongs_to :event_venue
  has_many :ticket_types
	validates :start_date, :presence => true 
	validate :date_event
	validate :same_date

	def date_event
	if start_date.to_s < Date.today.to_s
	errors.add("start_date must be later than current date of creation")
	end
	end

	def same_date
	events_list = Event.all
	events_list.each{ |event| 
	if event.event_venue_id == self.event_venue_id && event.start_date == self.start_date
		errors.add("Two events in the same place at the same date")
	
	end
	}
	end
	 
end

