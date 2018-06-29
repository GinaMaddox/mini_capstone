class Api::ProductsController < ApplicationController
  def all_products_action
    @products = Product.all
    render "all_products_view.json.jbuilder"
  end

  def first_product_action
    @product = Product.first
    render "first_product_view.json.jbuilder"
  end

  def second_product_action
    @product = Product.second
    render "second_product_view.json.jbuilder"
  end

  def index
    @products = Product.all
    render "index.json.jbuilder"
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.json.jbuilder"
  end

  def create
    @product = Product.new(
    name: "shoes",
    price: 20,
    image_url: "",
    description: "shoes")
    @product.save
    render "show.json.jbuilder"
  end
end
