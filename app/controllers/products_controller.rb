class ProductsController < ApplicationController
  def index
    if params[:sort] == "domestic"
      @products = Product.domestic
    else
      @products = Product.all
    end
  end

  def home
    @lastproducts = Product.recent
    @mostreviewed = Product.mostreviewed
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to  products_path
    else
      flash[:notice] = "Please double-check your entries"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to  products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :cost, :country_of_origin)
    end
end
