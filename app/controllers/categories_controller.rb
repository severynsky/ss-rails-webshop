class CategoriesController < ApplicationController

  before_action :find_category, except: [:index]
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
  end

  def update
    if @category.update(category_params)
    redirect_to "/"
    else
      render 'edit'
    end
  end

  def show
    @prods_from_cat = @category.products
    Product.find_by_category_id(params[:id])
  end

  def index
    @categories = Category.all
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end

end
