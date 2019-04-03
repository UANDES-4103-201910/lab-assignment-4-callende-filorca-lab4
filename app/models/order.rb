class Order < ApplicationRecord
  belongs_to :user
  has_many :tickets

	validates :ticket, :presence => true 
	before_validation :date_ticket
	
	def date_ticket
	if self.ticket.ticket_type.event.start_date.to_s < Date.today.to_s
	errors.add("You can't buy a ticket when the event has started")
	end
	end
end
