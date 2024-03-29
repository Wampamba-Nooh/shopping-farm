json.extract! category, :id, :identificator, :parent_id, :title

json.children do
  json.partial! partial: 'admin/categories/category', collection: category.children, as: :category
end

json.products do
  json.partial! partial: 'admin/products/product', collection: category.products, as: :product
end
