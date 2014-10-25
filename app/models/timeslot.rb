class Timeslot < ActiveRecord::Base
	belongs_to :window
	belongs_to :user

	def check_capacity(event)
		Event.find(event).users.count >= Event.find(event).capacity
	end

end
