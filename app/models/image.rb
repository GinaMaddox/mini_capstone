class Image < ApplicationRecord
  def product
    #product has many images = look in id column of Product and send product_id)
    Product.find_by(id: product_id)
  end
end
 