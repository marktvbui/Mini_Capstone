class ProductsController < ApplicationController


  def home
    @page_title = "Mark's Garage"

    @products = Products.all
  end

end
