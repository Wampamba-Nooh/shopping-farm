json.extract! @brand, :id, :identificator

json.created_at @brand.created_at.to_date
json.updated_at @brand.updated_at.to_date
