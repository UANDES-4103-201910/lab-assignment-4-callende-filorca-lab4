class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order
	validates :ticket_type, :presence => true 
	
	validate :date_event

	def date_event
	self.ticket_type.event.start_date < Date.today
	errors.add("The event has already started")
	end

	#La siguiente funcion esta en el modelo Order
end
