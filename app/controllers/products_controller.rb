class ProductsController < ApplicationController

  def new
    # @product = Product.new
  end

  def create
    render plain: params[:product]
  end

end
