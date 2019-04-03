class Order < ApplicationRecord
  belongs_to :user
  has_many :tickets

	validates :ticket, :presence => true 
	
	validate :date_ticket

	def date_ticket
	self.ticket.ticket_type.event.start_date < Date.today
	errors.add("You can't buy a ticket when the event has started")
	end
end
