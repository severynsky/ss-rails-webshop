class OrdersController < ApplicationController

  def new
    @order = Order.new
    @cart = Cart.find(session[:cart_id])
    @user = current_user
  end

  def show
    @cart = Cart.find(session[:cart_id])
  end

end
