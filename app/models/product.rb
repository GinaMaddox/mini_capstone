class Product < ApplicationRecord

  def is_discounted?
    price < 25
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def supplier
    supplier_id
    Supplier.find_by(id: supplier_id)
  end
  
  def images
    Image.where(product_id: id)
  end

  def image_url
    image_url
  end
end

