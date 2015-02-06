class CartsController < ApplicationController

  before_action :find_cart, only: [:show, :edit, :update, :destroy]
  def show
    # binding.pry
    # render plain: params
  end

  def index
    @product_records = ProductRecord.all
    # respond_with(@product_record)
  end

  private

  def find_cart
    @cart = Cart.find(params[:id])
  end
end
