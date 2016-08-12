class Ticket < ActiveRecord::Base
has_many :feedback_tickets

has_many :ticket_types
has_many :services , through: :ticket_types

has_many :user_services
has_many :services , through: :user_services

belongs_to :user
belongs_to :city
belongs_to :locality

	
end

