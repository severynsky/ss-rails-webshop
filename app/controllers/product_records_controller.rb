class ProductRecordsController < ApplicationController

  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_product_record, only: [:show, :edit, :update, :destroy]

  def create
    product = Product.find(params[:product_id])
    @product_record = @cart.product_records.build(product: product)

    if @product_record.save
      flash[:notice] = 'Item was added to carts'
      redirect_to '/'
    end
    # binding.pry
    session.delete(:counter)
  end

  def show
    # binding.pry
    # @product_record
    @record = ProductRecord.find(params[:id])
  end

  def destroy
    @product_record.destroy
    redirect_to 'cart'
  end

  private

  def set_product_record
    @product_record = ProductRecord.find(params[:id])
  end
end
