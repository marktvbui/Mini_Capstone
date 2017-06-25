class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :current_user_admin, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @page_title = "Game of Thrones Weapons!"
    sort_column = params[:sort]

      if params[:category]
        category = Category.find_by(name: params[:category])
        @products = category.products
      else
        @products = Product.all.order(sort_column)
      end

    if session[:count] == nil
      session[:count] = 1
    else 
      session[:count] += 1
    end
    @session_counter = session[:count]
    
  end

  
  def new
    @products = Product.new
  end

  def create
    @products = Product.new(
      name: params[:item_name],
      price: params[:item_price],
      description: params[:description],
      instock: params[:instock],
      supplier_id: params[:supplier_id]
      )
    if @products.save
      flash[:success] = "Product has been created"
      redirect_to "/products/#{@product.id}"
    else
      # need this for if loop in view @products.errors.full_messages.each do |message|
      flash[:danger] = @products.errors.full_messages.join("<br>").html_safe
    # end
      render :new
    end

  end

  def show
    @product = Product.find_by(id: params[:id])
  end


  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    product = Product.find_by(id: params[:id])
    product.assign_attributes(
      name: params[:item_name], 
      price: params[:item_price], 
      description: params[:description], 
      instock: params[:instock], 
      supplier_id: params[:supplier_id]
      )
    if product.save
      flash[:success] = "Product has been updated"
      redirect_to "/products/"
    else
      flash[:danger] = "No empty fields idiot!"
      render :new
    end
  end

  def contact
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    flash[:danger] = "Product destroyed!"
    redirect_to "/products"
  end

  def search
    @search_term = params[:search]
    @products = Product.where("name LIKE ?", "%#{@search_term}%")
    render :index
  end


  def supplier
  end

  def armor
    @products = Product.all
  end  


end
