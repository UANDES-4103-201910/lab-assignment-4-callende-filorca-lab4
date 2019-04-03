class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order
	validates :ticket_type, :presence => true 
	
	before_validation :date_event
	#validate :date_event

	def date_event
	if self.ticket_type.event.start_date.to_s < Date.today.to_s
	errors.add("The event has already started")
	end
	end

	#La siguiente funcion esta en el modelo Order
end
