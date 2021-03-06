class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
    redirect_to "/"
    else
      render 'edit'
    end
  end

  def show
    @category = Category.find(params[:id])
    @prods_from_cat = Product.where(category_id:  @category)
    Product.find_by_category_id(params[:id])
    # render plain: @prods_from_cat
  end

  def index
    @categories = Category.all
  end

  private
  def category_params
    params.require(:category).permit(:title)
  end

end
