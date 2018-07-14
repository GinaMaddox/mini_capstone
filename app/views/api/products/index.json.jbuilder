json.array! @products, partial: 'product', as: :product

# @products = comes from the controller @products
# 'product' = comes from _product file name
# as: :product = comes from the variable |product| in original index loop (below)


#_____________________


# json.array! @products.each do |product|
#   json.id product.id
#   json.name product.name
#   json.price product.price
#   json.image_url product.image_url
#   json.description product.description
# end
# json.formatted do 
#   json.discounted @product.is_discounted?
#   json.tax @product.tax
#   json.total @product.total
#  end