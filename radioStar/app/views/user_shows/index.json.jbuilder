json.array!(@user_shows) do |user_show|
  json.extract! user_show, :id, :show_id, :user_id
  json.url user_show_url(user_show, format: :json)
end
