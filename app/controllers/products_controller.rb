class ProductsController < ApplicationController
  include CurrentCart
  include Devise::Controllers::Helpers
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  # load_and_authorize_resource

  def new
    if user_signed_in?
      @product = Product.new
      @product.pictures.build
      @categories = Category.all
      @manufactures = Manufacture.all
    else
      flash[:notice] = "You have no rights to create new product"
      redirect_to root_url
    end
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
    @categories = Category.all
    @manufactures = Manufacture.all
  end

  def update
    binding.pry
    if @product.update(product_params)
      redirect_to "/"
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to '/'
  end

  def index
    $counter = index_counter
    @products = Product.all
    @categories = Category.all
    @manufactures = Manufacture.all
    @user = current_user
  end

  private

  def product_params
    params.require(:product).permit(:name, :category_id,  :manufacture_id, :color, :price, :sku, :description, pictures_attributes: [:image])
  end

  def find_product
    @product = Product.find(params[:id])
  end

end
