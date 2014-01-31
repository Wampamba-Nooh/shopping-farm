json.extract! @manufacturer, :id, :identificator, :short_description, :title, :full_description, :created_at, :updated_at
json.category_ids @manufacturer.categories.map{|c| c.id}