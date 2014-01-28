json.array!(@admin_pages) do |admin_page|
  json.extract! admin_page, :id, :name, :title, :content
end
