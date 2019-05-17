class ReviewController < ApplicationController
  before_filter { authenicate }

  def create
    new_review
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to product_path(params[:product_id]), notice: 'Product Deleted'
  end

  def new_review
    product = Product.find params[:product_id]
    review = product.review.create review_params
    review.user = current_user
    if review.valid?
      review.save
      redirect_to product_url(product.id)
    else
      redirect_to product_url(product.id), flash: { error: review.errors.full_messages }
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

  def authenicate
    current_user
  end
end
