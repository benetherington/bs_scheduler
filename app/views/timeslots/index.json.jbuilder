json.array!(@timeslots) do |timeslot|
  json.extract! timeslot, :id, :window_id, :user_id
  json.url timeslot_url(timeslot, format: :json)
end
