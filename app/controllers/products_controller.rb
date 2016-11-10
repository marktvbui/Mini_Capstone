class ProductsController < ApplicationController


  def home
    @page_title = "Mark's Garage"

    @products = Product.all
  end

end
