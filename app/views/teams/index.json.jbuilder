json.array!(@teams) do |team|
  json.extract! team, :name, :wins, :losses, :ties, :owner_id
  json.url team_url(team, format: :json)
end
