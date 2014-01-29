json.array!(@admin_pages) do |admin_page|
  json.extract! admin_page, :id, :identificator, :title, :short_content, :full_content
end
