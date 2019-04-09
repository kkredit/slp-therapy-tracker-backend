json.extract! provider, :id, :username, :fname, :lname, :email, :created_at, :updated_at
json.url provider_url(provider, format: :json)
