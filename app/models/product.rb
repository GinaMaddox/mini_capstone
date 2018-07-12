class Product < ApplicationRecord

  def is_discounted?
    price < 10
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
end

