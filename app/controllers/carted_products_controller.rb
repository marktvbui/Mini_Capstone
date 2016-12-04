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

        redirect_to "/checkout"
      else
        flash[:error] = "Log in, idiot!"
        redirect_to "/login"
      end  



      #Danish's version
      # def create
      # carted_product = CartedProduct.new(product_id: params[:product_id], user_id: current_user.id, quantity: params[:quantity].to_i, status: "carted")
      # carted_product.save
      # redirect_to "/carted_products"
      # end

  end

  def index 
    @carted_products = current_user.carted_products.where(status:"carted")
  end

  def update
    @carted_products = current_user.carted_products.where(status:"carted")
    @cartedproducts = CartedProduct.find_by(id: params[:carted_product_id])
    @cartedproducts.assign_attributes(quantity: params[:quantity].to_i)
    @cartedproducts.save

    if @cartedproducts.quantity == 0
       @cartedproducts.status = "removed"
       @cartedproducts.save
    end


    # @cartedproducts.assign_attributes(quantity: params[:quantity])
    # @cartedproduct.status = "removed" if params[:quantity] == 0
    # @cartedproducts.save

    flash[:success] = "Cart updated!"
    redirect_to "/checkout"
  end

  def destroy
  carted_product = CartedProduct.find_by(id: params[:id])
  carted_product.assign_attributes(status: "removed")
  carted_product.save

  flash[:success] = "Product removed"
  redirect_to "/carted_products"
  end


end  









