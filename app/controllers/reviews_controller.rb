class ReviewsController < ApplicationController

  before_action :load_product, only: [:create, :destroy]
  before_filter :ensure_logged_in, only: [:create, :destroy]

  def show
    @review = Review.find(params[:id])
  end

  def create
    @reviews = @product.reviews
    @review = @product.reviews.create(review_params.merge(:user => current_user))
    @review.user = current_user
    if request.xhr?
      render partial: 'products/review', :locals => {:review => @review}, status => :created
    else
      render 'products/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_url(@product)
  end

  private
  def review_params
    params.require(:review).permit(:comment, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end
end
