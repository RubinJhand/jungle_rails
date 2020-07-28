class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    @active_sale = Sale.active.first
  end

  def show
    @product = Product.find params[:id]
    @active_sale = Sale.active.first
  end

end
