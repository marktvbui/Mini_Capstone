class CartedProductsController < ApplicationController

  def create
       
      if current_user
         @order = Order.new(user_id: current_user.id)
         @order.save

        if @carted_products == nil 
           @carted_products = CartedProduct.new(quantity: params[:quantity], product_id: params[:product_id], user_id: current_user.id, status: "carted", order_id: @order.id)
           @carted_products.save
        else 
          @carted_products = CartedProduct.update(quantity: params[:quantity], product_id: params[:product_id], user_id: current_user.id, status: "carted", order_id: @order.id)
        end

        redirect_to "/carted_products"
      else
        flash[:error] = "Log in, idiot!"
        redirect_to "/login"
      end  

      #Danish's version
      # carted_product = CartedProduct.new(product_id: params[:product_id],                                user_id: current_user.id, 
      #                                   quantity: params[:quantity].to_i, 
      #                                   status: "carted")
      # carted_product.save
      # redirect_to "/carted_products"

  end

  def index 
    @carted_products = current_user.carted_products.where(status:"carted")
  end

  def update
    @carted_products = current_user.carted_products.where(status:"carted")
    # @carted_products = CartedProduct.find_by(id: params[:carted_product_id])
    @carted_products.assign_attributes(quantity: params[:quantity].to_i)
    @carted_products.save

    if @carted_products.quantity == 0
       @carted_products.status = "removed"
       @carted_products.save
    end

    @carted_products.assign_attributes(quantity: params[:quantity])
    @carted_product.status = "removed" if params[:quantity] == 0
    @carted_products.save

    flash[:success] = "Cart updated!"
    redirect_to "/carted_products"
  end

  def destroy
  carted_product = CartedProduct.find_by(id: params[:id])
  carted_product.assign_attributes(status: "removed")
  carted_product.save

  flash[:success] = "Product removed"
  redirect_to "/carted_products"
  end


end  









