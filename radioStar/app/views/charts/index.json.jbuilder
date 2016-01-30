json.array!(@charts) do |chart|
  json.extract! chart, :id, :name, :country, :source_url, :date
  json.url chart_url(chart, format: :json)
end
