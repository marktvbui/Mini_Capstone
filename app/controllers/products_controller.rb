class ProductsController < ApplicationController


  def home
    @page_title = "Mark's Garage"

    @products = Product.all
  end

  def ice
  end

  def longclaw
  end

  def needle
  end
  
end
