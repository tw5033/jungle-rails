class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.order(id: :desc).all
    # @products = Product.order(id: :desc).all
  end

  def new
    # @product = Product.new
  end

  def create
    # @product = Product.new(product_params)

    # if @product.save
    #   redirect_to [:admin, :products], notice: 'Product created!'
    # else
    #   render :new
    # end
  end
end
