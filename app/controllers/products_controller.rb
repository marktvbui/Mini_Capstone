class ProductsController < ApplicationController

  def index

    @page_title = "Game of Thrones Weapons!"
    @products = Product.all

  end

  
  def new
    
  end

  def create
  
    @products = Product.new(name: params[:item_name], price: params[:item_price], image: params[:image], description: params[:description])

    @products.save
    flash[:success] = "Product has been created"
    redirect_to "/products/"

  end

  def index
    @page_title = "Our Weapons"
    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params[:id])
    @list_of_ingredients = @products.xx.split(", ")
  end


  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    product = Product.find_by(id: params[:id])
    product.assign_attributes(name: params[:item_name], price: params[:item_price], image: params[:image], description: params[:description])
  
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

  
end

  
