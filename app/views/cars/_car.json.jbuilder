json.extract! car, :id, :make, :model, :year, :kilometers, :max_trunk_space, :current_trunk_usage, :wheel_usage, :max_wheel_usage_before_change, :created_at, :updated_at
json.url car_url(car, format: :json)
