class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = @product.review
    @average_rating = (@reviews.average :rating).round(2)
  end

end
