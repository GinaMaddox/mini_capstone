class Api::OrdersController < ApplicationController

  def show
    order_id = params[:id] #grab id from params
    @order = Order.find_by(id: order_id)
    render "show.json.jbuilder"
  end

  def create
    product = Product.find_by(id: params[:product_id])
    # calculated_subtotal = params[:quantity] * product.price
    # calculated_tax = calculated_subtotal * 0.09
    # calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity]
      # subtotal: calculated_subtotal,
      # tax: calculated_tax,
      # total: calculated_total,
      )
    @order.save
    render "show.json.jbuilder"
  end  
end

# left-hand columns in @order are from database, right-hand stuff comes from params, user logged in