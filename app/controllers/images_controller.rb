class ImagesController < ApplicationController



  def new
  end

  def create
    image = Image.new(url: params[:url], product_id: params[:product][:product_id])
    image.save

    redirect_to "/products/#{params[:product][:product_id]}"
  end




end
