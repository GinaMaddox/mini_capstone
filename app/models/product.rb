class Product < ApplicationRecord
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true 
  validates :description, length: { in: 10..500 }

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

  # def image_url
  #   image_url
  # end
end

