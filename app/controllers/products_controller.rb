class ProductsController < ApplicationController
  before_action :set_product_path


  def index
    @products = Product.all
    @categories = Category.all
  end


  def show
    # @category = Category.find_by(path: params[:category_path])
    @product = Product.find_by(path: params[:product_path])
    @order = Order.find_by(session_id: session[:session_id])
  end


  def category
    @category = Category.find_by(path: params[:category_path])
    @products = @category.products
  end

  
  private
  def set_product_path
    @products_path = true
  end
end
