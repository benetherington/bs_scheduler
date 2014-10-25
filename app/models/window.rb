class Window < ActiveRecord::Base
	belongs_to :event
	has_many :timeslots
	has_many :users, through: :timeslots
	# suggested validations:
	# validates_associated :event
	# validates :tasters, numerically: { less_than: :capacity }
end
