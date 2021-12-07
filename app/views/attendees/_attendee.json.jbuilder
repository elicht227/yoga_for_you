json.extract! attendee, :id, :event_id, :student_id, :created_at, :updated_at
json.url attendee_url(attendee, format: :json)
