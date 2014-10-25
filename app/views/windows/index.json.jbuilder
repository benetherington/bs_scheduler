json.array!(@windows) do |window|
  json.extract! window, :id, :event_id, :start_time, :duration, :capacity
  json.url window_url(window, format: :json)
end
