class ImagesController < ApplicationController

  before_action :curent_user_admin, only: [:new, :create]


  def new
  end

  def create
    image = Image.new(url: params[:url], product_id: params[:product][:product_id])
    image.save
    redirect_to "/products/#{params[:product][:product_id]}"
  end


end
