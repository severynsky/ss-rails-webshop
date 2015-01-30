class ProductsController < ApplicationController

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to "/"
    else
      render 'edit'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end

  private

  def product_params
    params.require(:product).permit(:name,:category, :image, :manufacture, :color, :price, :sku, :description, :id)
  end

end
