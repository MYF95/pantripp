class ProductlistsController < ApplicationController
  before_action :list_setter


  def create
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

end
