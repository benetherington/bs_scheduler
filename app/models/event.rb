class Event < ActiveRecord::Base
	has_many :windows
	accepts_nested_attributes_for :windows
	has_many :timeslots, through: :windows
	has_many :users, through: :timeslots

# todo: add validations to all models

# answer question "full?"
  def filled_up
  	# if event.capacity?
      self.users.count >= self.capacity
    # else
    #   false
    # end
  end

  def clear_out
  	self.timeslots.all.update_all(user_id: nil)
  end

end
