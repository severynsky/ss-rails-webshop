class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  include CurrentCart
  before_action :set_cart, only: [:create]
  respond_to :html

  def index
    @line_items = LineItem.all
    respond_with(@line_items)
    # product = Product.find(params[:product_id])
    # @line_item = @cart.line_items.build(product: product)

    # respond_to do |format|
    #
    #   if @line_item.save
    #     format.html{redirect_to @line_item.cart,
    #        notice: 'Line item was successfully created.'}
    #
    #     format.json {render action: 'show',
    #        status: :created, location: @line_item}
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @line_item.errors,
    #        status: :unprocessable_entity }
    #   end
    # end
  end

  def show
    respond_with(@line_item)
  end

  def new
    @line_item = LineItem.new
    respond_with(@line_item)
  end

  def edit
  end

  def create
    # binding.pry
    @line_item = LineItem.new(product_id: params[:product_id], cart_id: @cart.id)
    @line_item.save
    respond_with(@line_item)
  end

  def update
    @line_item.update(line_item_params)
    respond_with(@line_item)
  end

  def destroy
    @line_item.destroy
    respond_with(@line_item)
  end

  private
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id)
    end
end
