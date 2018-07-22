class Api::CartedProductsController < ApplicationController

  def create
    # each time a
    @carted_product = CartedProduct.new(
    user_id: current_user.id,
    product_id: params[:product_id],
    quantity: params[:quantity],
    status: "carted"
    )
    @carted_product.save
    render "show.json.jbuilder"
  end

  def index
    # @carted_products = current_user.carted_products.where(user_id: current_user.id, status: "carted")
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    render "index.json.jbuilder"
  end
end

# @products = Product.where('name LIKE ?', "%#{user_input}%")