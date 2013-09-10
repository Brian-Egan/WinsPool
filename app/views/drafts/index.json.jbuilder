json.array!(@drafts) do |draft|
  json.extract! draft, :round, :pick, :user_id, :team_id
  json.url draft_url(draft, format: :json)
end
