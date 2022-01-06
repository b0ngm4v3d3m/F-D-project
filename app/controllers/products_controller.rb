class ProductsController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @product = Product.find_by(id: params[:id])
    @products = Product.all
    @cart = current_cart
    @order_item = current_cart.order_items.new
  end
end
