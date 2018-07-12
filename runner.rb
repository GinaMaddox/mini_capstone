require 'unirest'

#INDEX ACTION
#INDEX ACTION
# response = Unirest.get("localhost:3000/api/products")
# products = response.body
# p response.body

# #SHOW ACTION
# product_id = 5
# response = Unirest.get("localhost:3000/api/products/#{product_id}")
# p response.body

# # #create action
# response = Unirest.post("http://localhost:3000/api/products", 
#   parameters: {
#     name: "",
#     price: "",
#     iamge_url: "",
#     description: ""
#   })
# p response.body

# # # update action
# # # p "Which item would you like to update?"
# # product_id = gets.chomp
# product_id =  7
# response = Unirest.patch("http://localhost:3000/api/products/#{product_id}",
#   parameters: {
#     name: "",
# #     price: "",
# #     iamge_url: "",
# #     description: ""
#   })
# p response.body