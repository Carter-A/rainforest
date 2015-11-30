class ReviewsController < ApplicationController

  before_action :load_product, only: [:create, :destroy]
  before_filter :ensure_logged_in, only: [:create, :destroy]

  def show
    @review = Review.find(params[:id])
  end

  def create
    @reviews = @product.reviews
    @review = @product.reviews.build(review_params.merge(:user => current_user))
    @review.user = current_user
    if request.xhr?
      @review.save
    else
      @review.save
      redirect_to 'products/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def review_params
    params.require(:review).permit(:comment, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end
end
