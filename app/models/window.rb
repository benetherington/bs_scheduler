class Window < ActiveRecord::Base
	belongs_to :event
	has_many :timeslots
	has_many :users, through: :timeslots
	# suggested validations:
	# validates_associated :event
	# validates :tasters, numerically: { less_than: :capacity }

  def check_capacity
  	if self.capacity
  		self.users.count >= self.capacity
  	else
  		nil
  	end
  end


end
