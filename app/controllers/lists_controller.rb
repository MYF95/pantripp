class ListsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :edit]

  def index
    @lists = List.paginate(page: params[:page], per_page: 9)
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:info] = "New list #{@list.name} created!"
      redirect_to @list
    else
      render 'new'
    end
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(list_params)
      flash[:info] = 'List updated'
      redirect_to @list
    else
      render 'edit'
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      flash[:info] = 'List deleted'
      redirect_to lists_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to root_url
    end
  end

  def users
    @list = List.find(params[:list_id])
  end

  def products
    @product = Product.find(params[:product_id])
    @lists = List.paginate(page: params[:lists_page], per_page: 9)
    @userlist = current_user.lists.paginate(page: params[:my_list_page], per_page: 3)
  end

  private

    def list_params
      params.require(:list).permit(:name, :capacity, :location)
    end
end
