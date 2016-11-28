class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @page_title = "Game of Thrones Weapons!"
    sort_column = params[:sort]
    @products = Product.all.order(sort_column)

    # session (hash), stores as a cookie
    if session[:count] == nil
      session[:count] = 1
    else
      session[:count] += 1
    end
    @session_counter = session[:count]
  end

  
  def new
  end

  def create
    @products = Product.new(name: params[:item_name], price: params[:item_price], description: params[:description], instock: params[:instock], item_class: params[:item_class])
    @products.save
    flash[:success] = "Product has been created"
    redirect_to "/products/"

  end

  def show
    @product = Product.find_by(id: params[:id])
    session[:quantity] == params[:quantity]
    @session_quantity = session[:quantity]
  end


  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    product = Product.find_by(id: params[:id])
    product.assign_attributes(name: params[:name], price: params[:price], description: params[:description], instock: params[:instock], item_class: params[:item_class])
    product.save
    flash[:success] = "Product has been updated"
    redirect_to "/products/"
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

  
