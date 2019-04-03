class User < ApplicationRecord
  has_many :orders

	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,  on: :create }  

	validates :phone_number, length: {in: 9..12} 
	validates :password, length: {in: 8..12}
	validates :phone_number, numericality: {only_integer: true}
	validates :password, format: {with: /\A[a-zA-Z0-9]*\z/ }
end
