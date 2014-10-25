class Event < ActiveRecord::Base
	has_many :windows
	accepts_nested_attributes_for :windows
	has_many :timeslots, through: :windows
	has_many :users, through: :timeslots


  def check_capacity(event)
  	Event.find(event).users.count >= Event.find(event).capacity
  end


end
