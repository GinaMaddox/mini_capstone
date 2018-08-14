class Api::ProductsController < ApplicationController
   # before_action :authenticate_admin, except:[ :index, :show]

  # def all_products_action
  #   @products = Product.all
  #   render "all_products_view.json.jbuilder"
  # end

  # def first_product_action
  #   @product = Product.first
  #   render "first_product_view.json.jbuilder"
  # end

  # def second_product_action
  #   @product = Product.second
  #   render "second_product_view.json.jbuilder"
  # end

  def index
    # user_input = params[:search]
    # if user_input
    #   @products = Product.where('name LIKE ?', "%#{user_input}%").order(:id)
    if params[:category]
      @products = category.products
    else
      @products = Product.all
    end
      render "index.json.jbuilder"
  end


  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.json.jbuilder"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      # image_url: params[:image_url],
      description: params[:description],
      supplier_id: params[:supplier_id])
    
    if @product.save
      render "show.json.jbuilder"
    else render json: {errors: @product.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.name = params[:name] || @product.name,
    @product.price = params[:price] || @product.price,
    # @product.image_url = params[:image_url] || @product.image_url,
    @product.description = params[:description] || @product.description
    
    if @product.save
      render "show.json.jbuilder"
    else 
      render json: {errors: @product.errors.full_messages}, status: :unprocessible_entity
    end
  end
  # def update
  #   @product.update(
  #     name: params[:name] || @product.name,
  #     price: params[:price] || @product.price,
  #     image_url: params[:image_url] || @product.image_url,
  #     description: params[:description] || @product.description
  #   )
  #   render "show.json.jbuilder"
  # end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    render json: {message: "Product successfully deleted"}
  end
 end

