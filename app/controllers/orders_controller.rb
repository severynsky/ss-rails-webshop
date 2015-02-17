class OrdersController < ApplicationController
  before_action :find_all_for_order

  def new
    # binding.pry
    @order = Order.new
  end

  def create
    @order = Order.new(cart_id: @cart.id, user_id: @user.id)
    if @order.save
      redirect_to 'orders#show'
    else
      render 'new'
    end
  end

  def show
    @cart = Cart.find(session[:cart_id])
  end

  private

  def find_all_for_order
    @cart = Cart.find(session[:cart_id])
    @user = current_user
  end

  def order_params
    params.require(:order).permit(:cart_id, :user_id)
  end

end
