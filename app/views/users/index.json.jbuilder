json.array!(@users) do |user|
  json.extract! user, :name, :owner, :draft_order
  json.url user_url(user, format: :json)
end
