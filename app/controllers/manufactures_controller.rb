class ManufacturesController < ApplicationController
  before_action :find_manufactures, only: [:show, :edit, :update, :destroy]

  def new
    @manufacture = Manufacture.new
  end

  def create
    @manufacture = Manufacture.new(manufacture_params)
    if @manufacture.save
      redirect_to @manufacture
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @manufacture.update(manufacture_params)
      redirect_to "/"
    else
      render 'edit'
    end
  end

  def show
    @prods_from_manuf = Product.where(manufacture_id: params[:id])
    # render plain: @prods_from_manuf.manufacture_id
    # render plain: params[:id]
  end

  def index
    @manufactures = Manufacture.all
  end

  private

  def manufacture_params
    params.require(:manufacture).permit(:title)
  end

  def find_manufactures
    @manufacture = Manufacture.find(params[:id])
  end

end
