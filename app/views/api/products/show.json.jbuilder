json.partial! 'product', product: @product

#'product' = name of file _product
# product:  = tied to product variable
# @product = ties to @product in controller



# json.id @product.id
# json.name @product.name
# json.price @product.price
# json.image_url @product.image_url
# json.description @product.description

# json.formatted do 
#   json.discounted @product.is_discounted?
#   json.tax @product.tax
#   json.total @product.total
#  end




