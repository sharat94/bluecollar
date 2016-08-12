class Locality < ActiveRecord::Base
belongs_to :city
has_many :users
has_many :tickets
has_many :user_services



end
