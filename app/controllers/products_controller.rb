class ProductsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :edit]

  def index
    @products = Product.paginate(page: params[:page], per_page: 9)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:success] = "Product updated"
      redirect_to @product
    else
      render 'edit'
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:info] = "New product #{@product.name} created!"
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:info] = "Product deleted"
      redirect_to products_path
    else
      flash[:error] = "Something went wrong"
      redirect_to @product
    end
  end

  private

    def product_params
      params.require(:product).permit(:name, :brand, :ingredients, :info, :shelf)
    end

end
