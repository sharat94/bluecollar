class City < ActiveRecord::Base
	has_many :users
	has_many :tickets
	has_many :localities
end
