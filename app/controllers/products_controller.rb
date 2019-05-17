class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @current_user = current_user
    @reviews = @product.review.order(created_at: :desc)
    @average_rating = (@reviews.average :rating).round(2) unless @reviews.blank?
  end

end
