class ProductRecordsController < ApplicationController

  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_product_record, only: [:show, :edit, :update, :destroy]

  def create
    @cart = Cart.last
    product = Product.find(params[:product_id])
    @product_record = @cart.product_records.build(product: product)
    if @product_record.save
      flash[:notice] = 'Item was added to carts'
      redirect_to @cart
    end

    cart_item_check = @cart.product_records.find_by(product_id: (params[:product_id]))
    # binding.pry
    if cart_item_check.product.id == params[:product_id].to_i
      cart_item_check.quantity += 1
      cart_item_check.save
      $print = "yes"
    else
      $print = "no1"
    end
    session.delete(:counter)
  end

  def show
    # binding.pry
    # @product_record
    @record = ProductRecord.find(params[:id])
  end

  def destroy
    @product_record.destroy
    redirect_to '/'
  end

  private

  def set_product_record
    @product_record = ProductRecord.find(params[:id])
  end
end
