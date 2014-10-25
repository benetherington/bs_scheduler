class Timeslot < ActiveRecord::Base
	belongs_to :window
	belongs_to :user
end
