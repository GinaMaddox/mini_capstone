require 'unirest'

# response = Unirest.get("http://localhost:3000/api/all_products_url")
# p response.body

# response = Unirest.get("http://localhost:3000/api/first_product_url")
# p response.body

# response = Unirest.get("http://localhost:3000/api/second_product_url")
# p response.body

#these are user_input commands for create
# p "Name: "
# p "Price: "
# p "Image:"
# p "Description:"

# response = Unirest.post("http://localhost:3000/api/products", 
#   parameters: {
#     input_name: " "
#     input_price: 
#     input_image_url: " " 
#     input_description: " "
#   }
# )

# p response.body

# response = Unirest.post("http://localhost:3000/api/products", parameters: {input_name: gets.chomp, input_price: gets.chomp, input_image_url: " ", input_description: gets.chomp})

# p response.body



#*******for update*********

# p "Which item would you like to update?"
# product_id = gets.chomp

response = Unirest.patch("http://localhost:3000/api/products/7", 
  parameters: {
    input_name: "toothbrush"
  }
)

 p response.body


#************for delete*****************
# response = Unirest.delete("http://localhost:3000/api/products/8")

# p response.body