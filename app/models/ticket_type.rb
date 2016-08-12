class TicketType < ActiveRecord::Base
belongs_to :service
belongs_to :ticket
end
