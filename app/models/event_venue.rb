class EventVenue < ApplicationRecord
	validates :capacity ,numericality: { only_integer: true }
	validates :capacity ,numericality: { greater_than: 0 }
	validates :name ,length: { minimum: 20 }
end
