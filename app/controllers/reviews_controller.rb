class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def index
    @product = Product.find(params[:id])
    @reviews = @product.reviews
  end

  def show
    @review = Review.find(params[:id])
    @products = Product.all()
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      redirect_to product_path(@review.product)
    else
      flash[:notice] = "Make sure your review is between 50 & 250 characters"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def update
    @review = Review.find(params[:id])
    @product = @review.product
    if @review.update(review_params)
      redirect_to product_path(@product)
    else
      render 'reviews/edit'
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end

  private
    def review_params
      params.require(:review).permit(:auhtor, :content_body, :rating, :product_id)
    end
end
