# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10.times do 
#   product = Product.create(name: Faker::Commerce.product_name, price: Faker::Commerce.price, image_url: "", description: Faker::Movie.quote)
# end




# supplier = Supplier.new(name: "Johnny", email: "asd@gmail.com", phone_number: "23456789")
# supplier.save


# supplier_1 = Supplier.new(name: "Antonio", email: "jsd@gmail.com", phone_number: "23452789")
# supplier_1.save

# 4.times do
#   supplier = Supplier.create(name: Faker::Company.name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number)
# end

#add Suppliers to any existing products without one.
# suppliers = Supplier.all
# products = Product.all

# products.each do |product|
#   product.supplier_id = suppliers.sample.id
#   product.save
# end

# 40.times do
#   image = Image.create(image_url: Faker::Avatar.image)
# end

# images = Image.all
# products = Product.all

# images.each do |image|
#  image.product_id = product.image_url
#  image.save
# end

# products.each do |product|
#   Image.create(image_url: Faker::Avatar.image,  product_id: product.id)
# end

order = Order.new(user_id: 2, product_id: 2, quantity: 5)
  order.save

