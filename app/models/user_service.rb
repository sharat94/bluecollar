class UserService < ActiveRecord::Base
belongs_to :user 
belongs_to :service 
belongs_to :locality_id
end
