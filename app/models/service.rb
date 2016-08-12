class Service < ActiveRecord::Base
has_many :user_services
has_many :ticket_types
has_many :tickets , through: :ticket_types
has_many :user_services
has_many :users , through: :user_services
has_many :user_services
has_many :tickets , through: :user_services
end
