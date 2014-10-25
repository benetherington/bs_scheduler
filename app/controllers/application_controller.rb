class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 
  private

  def create_timeslots(caps, id)
    caps.times do
      Timeslot.create({window_id: id})
    end
  end

  def create_windows
    if params["event"]["windows_attributes"] 
      params["event"]["windows_attributes"].each do |incomingParams|
        @winparams = incomingParams[1]
        unless @winparams["capacity"] == ""
            window = Window.create({
              event_id: @event.id,
              capacity: @winparams["capacity"].to_i,
              duration: 30,
              start_time: DateTime.new(@winparams["start_time(1i)"].to_i,
                                       @winparams["start_time(2i)"].to_i,
                                       @winparams["start_time(3i)"].to_i,
                                       @winparams["start_time(4i)"].to_i,
                                       @winparams["start_time(5i)"].to_i)
              })
            create_timeslots(@winparams["capacity"].to_i, window.id)
        end
      end
    end
  end


end
