class Supplier < ApplicationRecord
  def products
    Product.where(supplier_id: id)
  end
end

#return products for this supplier
#use .where to find all products for this supplier (.find only brings one)