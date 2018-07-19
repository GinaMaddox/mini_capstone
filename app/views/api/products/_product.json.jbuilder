#index product page in API
json.id product.id
json.name product.name
json.price product.price
json.description product.description

json.formatted do 
  json.is_discounted? product.is_discounted?
  json.tax product.tax
  json.total product.total
end

json.supplier product.supplier
json.images product.images
json.categories product.categories