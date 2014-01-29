json.extract! @category, :id, :identificator, :parent_id

json.children do
  json.partial! partial: 'admin/categories/category', collection: @category.children, as: :category
end
