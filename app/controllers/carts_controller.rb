class CartsController < ApplicationController

  before_action :find_cart, only: [:show, :edit, :update, :destroy]
  def show
  end

  def index
    @cart = Cart.all
  end

  def destroy
  end

  private

  def find_cart
    @cart = Cart.find(params[:id])
  end
end
