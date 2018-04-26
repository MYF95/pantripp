class ListsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :edit, :add_userlist, :delete_userlist]
  before_action :list_getter, except: [:index, :new, :create, :products, :add_product]
  before_action :product_getter, only: [:products, :add_product]
  before_action :user_getter, only: [:add_list, :delete_list]

  def index
    @lists = List.paginate(page: params[:page], per_page: 9)
  end

  def new
    @list = List.new
    respond_to do |format|
      format.html
      format.js { render layout: false}
    end
  end

  def show; end

  def edit; end

  def remove_product; end

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
    if @list.update_attributes(list_params)
      flash[:info] = 'List updated'
      redirect_to @list
    else
      render 'edit'
    end
  end

  def destroy
    if @list.destroy
      flash[:info] = 'List deleted'
      redirect_to lists_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to root_url
    end
  end

  # Products inside list
  def products
    @lists = List.paginate(page: params[:lists_page], per_page: 9)
    @userlist = current_user.lists.paginate(page: params[:my_list_page], per_page: 3)
  end

  def add_product

    #TODO filter products in list by alphabetical order
    #TODO control capacity vs total quantities
    #TODO adding quantities directly
    #TODO removing a product with a negative number is adding it

    @list = List.find(params[:list_id])

    #TODO migracion para 1 por defecto

    @productlist = Productlist.find_by(list: @list, product: @product)
    if @productlist.blank?
      @productlist = @product.productlists.new(list: @list, quantity: params[:productlist][:quantity])
      if @productlist.save
        flash[:info] = "Product added to #{@list.name}"
        redirect_to list_path(@list)
      else
        flash[:error] = 'Something went wrong'
        redirect_to root_path
      end
    else
      @productlist.quantity += params[:productlist][:quantity].to_i
      @productlist.save
      flash[:success] = "Amount added to #{@product.name}"
      redirect_to list_path(@list)
    end

  end

  def delete_product
    @product = Product.find(params[:product_id])
    quantity = params[:productlist][:quantity].to_i
    @productlist = Productlist.find_by(list: @list, product: @product)
    if (@productlist.quantity - quantity) > 0
      @productlist.quantity -= quantity
      @productlist.save
      flash[:info] = 'Item quantity reduced'
      redirect_to remove_product_path(@list)
    else
      if @productlist.destroy
        flash[:info] = 'Item removed from list'
        redirect_to list_path(@list)
      else
        flash[:info] = 'Something went wrong'
        redirect_to root_path
      end
    end
  end

  # Users inside list
  def users; end

  def add_list
    @userlist = @user.userlists.new(list: @list)
    if @userlist.save
      flash[:info] = 'List added to your lists'
      redirect_to user_list_path(@user)
    else
      redirect_to root_path
    end
  end

  def delete_list
    @userlist = Userlist.find_by(user: @user, list: @list)
    if @userlist.destroy
      flash[:info] = 'List removed from your lists'
      redirect_to user_list_path(@user)
    else
      flash[:error] = 'Something went wrong'
      redirect_to root_path
    end
  end

  private

    def list_getter
      @list = List.find(params[:id])
    end

    def product_getter
      @product = Product.find(params[:id])
    end

    def user_getter
      @user = User.find(params[:user_id])
    end

    def list_params
      params.require(:list).permit(:name, :capacity, :location)
    end


end
