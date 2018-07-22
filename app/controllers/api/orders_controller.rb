class Api::OrdersController < ApplicationController

  def show
    order_id = params[:id] #grab id from params
    @order = Order.find_by(id: order_id)
    render "show.json.jbuilder"
  end

  def create
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    calculated_subtotal = 0
    @carted_products.each do |carted_product|
      calculated_subtotal += carted_product.product.price * carted_product.quantity
    end
    # calculated_subtotal = params[:quantity] * product.price
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
      )
    @order.save

    @carted_products.each do |carted_product|
      carted_product.status = "purchased"
      carted_product.order_id = @order.id
      carted_product.save
    end
    render "show.json.jbuilder"
  end  
end

# left-hand columns in @order are from database, right-hand stuff comes from params, user logged in