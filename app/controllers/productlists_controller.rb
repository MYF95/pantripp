class ProductlistsController < ApplicationController
  before_action :list_setter
  before_action :product_setter, only:[:create]

  def create
    @productlist = @product.productlists.new(list: @list, quantity: params[:productlist][:quantity])
    if @productlist.quantity.nil?
      @productlist.quantity = 1
    end
    if @productlist.save
      flash[:info] = "Product added to #{@list.name}"
      redirect_to products_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to root_path
    end
  end

  def destroy
    @productlist = Productlist.find(params[:id])
    if @productlist.destroy
      flash[:info] = 'Product removed from list'
      redirect_to @list
    else
      flash[:error] = 'Something went wrong'
      redirect_to root_path
    end
  end

  private

    def list_setter
      @list = List.find(params[:list_id])
    end

    def product_setter
      @product = Product.find(params[:product_id])
    end

end
