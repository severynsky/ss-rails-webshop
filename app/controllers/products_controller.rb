class ProductsController < ApplicationController
  include CurrentCart
  include Devise::Controllers::Helpers
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  def new
    if user_signed_in?
      @product = Product.new
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
    if @product.update(product_params)
      redirect_to "/"
      # render plain: params[:product]
    else
      render 'edit'
    end
  end

  def show
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
    params.require(:product).permit(:name,:category_id, :image, :manufacture_id, :color, :price, :sku, :description, :id)
  end

  def find_product
    @product = Product.find(params[:id])
  end

end
