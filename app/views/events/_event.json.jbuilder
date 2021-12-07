json.extract! event, :id, :event_name, :teacher_id, :date, :start_time,
              :duration, :end_time, :park_id, :category_id, :event_description, :created_at, :updated_at
json.url event_url(event, format: :json)
