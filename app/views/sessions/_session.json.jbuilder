json.extract! session, :id, :time, :location_id, :provider_id, :created_at, :updated_at
json.url session_url(session, format: :json)
