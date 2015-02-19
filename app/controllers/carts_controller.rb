class CartsController < ApplicationController

  before_action :find_cart, only: [:show, :edit, :update, :destroy]
  def show
  end

  def index
    @cart = Cart.all
    # @product_records = ProductRecord.all
    # respond_with(@product_record)
  end

  def destroy
    # render plain: params
  end

  private

  def find_cart
    @cart = Cart.find(params[:id])
  end
end
