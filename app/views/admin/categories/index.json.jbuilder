json.array!(@categories) do |category|
  json.extract! category, :id, :name, :parent_id
  json.children do
    json.array!(category.children) do |c|
      json.extract! c, :id, :name, :parent_id
    end
  end
end
