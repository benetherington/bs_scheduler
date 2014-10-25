class User < ActiveRecord::Base
	has_many :timeslots
end
