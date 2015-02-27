class ProductsController < ApplicationController
  include CurrentCart
  include Devise::Controllers::Helpers
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :find_cart, only: :index
  before_action :find_for_prod, except: [:destroy]

  # load_and_authorize_resource

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
    # binding.pry
    if @product.update(product_params)
      render 'show'
    else
      # binding.pry
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
    $counter =  index_counter

    @products = Product.all
    @products = Product.manufacture(params[:manufacture_id]) if params[:manufacture_id].present?
    @user = current_user
  end

  def custom_action
    if params[:category]
      @products = Product.category(params[:category])
    elsif params[:manufacture]
      @products = Product.manufacture(params[:manufacture])
    end
    respond_to do |format|
      format.js
    end
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
    # binding.pry
    @cart = Cart.find_by(id: session[:cart_id])
  end

end
