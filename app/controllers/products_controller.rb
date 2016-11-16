class ProductsController < ApplicationController

  def home

    @page_title = "Game of Thrones Weapons!"
    @products = Product.all

  end

  
  def new
  end

  def create
  
    @products = Product.new(name: params[:item_name], price: params[:item_price], image: params[:image], description: params[:description])

    @products.save

  end

  def index
    @page_title = "Our Weapons"
    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params[:id])
  end


  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    product = Product.find_by(id: params[:id])
    product.assign_attributes(name: params[:item_name], price: params[:item_price], image: params[:image], description: params[:description])
    product.save

  end

  def contact
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
  end

  
end

  # def ice
  #   @page_title = "Ice"
  # end

  # def longclaw
  #   @page_title = "Longclaw"
  # end

  # def needle
  #   @page_title = "Needle"
  # end

  # def oathkeeper
  #   @page_title = "Oathkeeper"
  # end

  # def dragonglass
  #   @page_title = "Dragonglass dagger"
  # end

  # def arakh
  #   @page_title = "Khal Drogo's Arakh"
  # end

  # def hammer
  #   @page_title = "Robert's War Hammer"
  # end

  # def hand
  #   @page_title = "Jaime's Golden Hand"
  # end
