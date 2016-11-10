class ProductsController < ApplicationController


  def home
    @page_title = "Mark's Garage"

    @products = Product.all
  end

  def ice
    @page_title = "Ice"
  end

  def longclaw
    @page_title = "Longclaw"
  end

  def needle
    @page_title = "Needle"
  end

end
