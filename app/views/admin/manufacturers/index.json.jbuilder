json.array!(@manufacturers) do |manufacturer|
  json.extract! manufacturer, :id, :identificator, :short_description, :title, :full_description
  json.category_ids manufacturer.categories.map{|c| c.id}
end
