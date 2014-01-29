json.extract! @product, :id, :identificator, :brand_id, :short_description, :full_description, :title

json.created_at @product.created_at.to_date
json.updated_at @product.updated_at.to_date

json.category_ids @product.categories.map{|c| c.id}

json.brand do |json|
  json.id @product.brand.id
  json.identificator @product.brand.identificator
end

json.product_pictures do |json|
  json.array!(@product.product_pictures) do |product_picture|
    json.extract! product_picture, :id, :created_at, :updated_at
    json.preview50x50 product_picture.picture.url(:preview50x50, timestamp: false)
    json.preview80x80 product_picture.picture.url(:preview80x80, timestamp: false)
    json.preview100x100 product_picture.picture.url(:preview100x100, timestamp: false)
    json.preview200x200 product_picture.picture.url(:preview200x200, timestamp: false)
    json.preview300x300 product_picture.picture.url(:preview300x300, timestamp: false)
  end
end
