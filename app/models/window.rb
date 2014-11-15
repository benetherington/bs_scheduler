class Window < ActiveRecord::Base

	belongs_to :event
	has_many :timeslots
	has_many :users, through: :timeslots

	# suggested validations:
	# validates_associated :event
	# validates :tasters, numerically: { less_than: :capacity }

# answer question "full?" returning nil if window.capacity not set
  def filled_up
  	if self.capacity
  		self.users.count >= self.capacity
  	else
  		nil
  	end
  end

# return available slot, return nil if full
  def get_slot
    unless filled_up || Event.find(self.event_id).filled_up
      self.timeslots.find { |slot| !slot.user }
    end
  end


  # def assign_user
  #   # target = get_slot
  #   get_slot.update(user_id: 1)
  # end

end
