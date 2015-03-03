class ProductRecordsController < ApplicationController

  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_product_record, only: [:show, :edit, :update, :destroy]

  def create
    product = Product.find(params[:product_id])
    @product_record = @cart.product_records.find_by(product_id: (params[:product_id]))

    if @product_record
      @product_record.quantity += 1
      @product_record.save
    else
      @cart.product_records.build(product: product).save
      flash[:notice] = 'Item was added to cart'
    end

    respond_to do |format|
      format.html {redirect_to @cart}
      format.js
    end

  end

  def show
    # binding.pry
    @record = ProductRecord.find(params[:id])
  end

  def destroy
    if @product_record.destroy
      respond_to do |format|
        format.html {redirect_to '/'}
        format.js
      end
    else
      flash[:notice] = "Product record wasn`t deleted"
    end
  end

  private

  def set_product_record
    @product_record = ProductRecord.find(params[:id])
  end
end
