class ProductsController < ApplicationController
  include CurrentCart
  include Devise::Controllers::Helpers
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :find_cart, only: :index
  before_action :find_for_prod, except: [:destroy]

  def new
    if user_signed_in?
      @product = Product.new
      @product.pictures.build
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
    @product.pictures.build
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "product has been updated"
      render 'show'
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    if @product.destroy
      redirect_to '/'
    else
      flash[:notice] = "error while deleting"
    end
  end

  def index
    @products = Product.all
    @user = current_user
  end

  def custom_action
    if params[:category]
      $category_title = Category.find(params[:category])
      @products = Product.category(params[:category])
    elsif params[:manufacture]
      $manufacture_title = Manufacture.find(params[:manufacture])
      @products = Product.manufacture(params[:manufacture])
    end
    # binding.pry
    respond_to do |format|
      format.js
    end
    $manufacture_title = nil
    $category_title = nil
  end


  private

  def find_for_prod
    @categories = Category.all
    @manufactures = Manufacture.all
  end

  def product_params
    params.require(:product).permit(:name, :category_id,  :manufacture_id, :color, :price, :sku, :description, pictures_attributes: [:image])
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def find_cart
    @cart = Cart.find_by(id: session[:cart_id])
  end

end
