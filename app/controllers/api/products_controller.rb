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
    name: params[:input_name],
    price: params[:input_price],
    image_url: params[:input_image_url],
    description: params[:input_description])
    @product.save
    render "show.json.jbuilder"
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.name = params[:input_name] || @product.name,
    @product.price = params[:input_price] || @product.price,
    @product.image_url = params[:input_image_url] || @product.image_url,
    @product.description = params[:input_description] || @product.description
    @product.save
    render "show.json.jbuilder"
  end

  # def update
  #   @product.update(
  #     name: params[:input_name] || @product.name,
  #     price: params[:input_price] || @product.price,
  #     image_url: params[:input_image_url] || @product.image_url,
  #     description: params[:input_description] || @product.description
  #   )
  #   render "show.json.jbuilder"
  # end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    render json: {message: "Product deleted"}
  end
end
