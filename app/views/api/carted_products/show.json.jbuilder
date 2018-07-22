json.id @carted_product.id
json.user_id @carted_product.user_id
json.product_id @carted_product.product_id
json.quantity @carted_product.quantity
json.status @carted_product.status
json.product @carted_product.product #this gives all the product info

# json.product do
#   json.partial! @carted_product.product_id, partial: 'product', as: :product_id
# end