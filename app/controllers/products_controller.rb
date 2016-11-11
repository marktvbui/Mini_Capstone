class ProductsController < ApplicationController

  def home

    @page_title = "Game of Thrones Weapons!"

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

  def oathkeeper
    @page_title = "Oathkeeper"
  end

  def dragonglass
    @page_title = "Dragonglass dagger"
  end

  def arakh
    @page_title = "Khal Drogo's Arakh"
  end

  def hammer
    @page_title = "Robert's War Hammer"
  end
  
end
