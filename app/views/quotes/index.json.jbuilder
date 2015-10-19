json.array!(@quotes) do |quote|
  json.extract! quote, :id, :message, :genre, :user_id
  json.url quote_url(quote, format: :json)
end
