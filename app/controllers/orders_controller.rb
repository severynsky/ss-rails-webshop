class OrdersController < ApplicationController
  before_action :prepare_order

  def new
    if !@cart.product_records.empty?
      @order = Order.new
    else
      flash[:notice] =  'You cannot create order with empty cart!'
      redirect_to '/'
    end
  end

  def create
    @order = Order.new(user_id: @user.id)
    @order.product_records = @cart.product_records
    binding.pry
    if @order.save
      redirect_to 'orders#show'
      @cart.delete
    else
      render 'new'
    end
  end

  def show
    @order = Order.find_by(user_id:(current_user.id))
  end

  def index
    @orders = current_user.orders
    # binding.pry
  end

  private

  def prepare_order

    @cart = Cart.find_by(id: session[:cart_id])
    @user = current_user
  end

  def order_params
    params.require(:order).permit(:cart_id, :user_id)
  end

end
