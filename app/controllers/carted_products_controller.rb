class CartedProductsController < ApplicationController

  def create
      # session[:quantity] = params[:quantity]
      # @purchase_quantity = session[:quantity]
      if current_user
        # @product = Product.find_by(id: params[:product_id])
         @order = Order.new(user_id: current_user.id)
         @order.save

        if @carted_products == nil 
           @carted_products = CartedProduct.new(quantity: params[:quantity], product_id: params[:product_id], user_id: current_user.id, status: "carted", order_id: @order.id)
           @carted_products.save
        else 
          @carted_products = CartedProduct.update(quantity: params[:quantity], product_id: params[:product_id], user_id: current_user.id, status: "carted", order_id: @order.id)
        end
        
        # @order.subtotal = @product.price * @order.quantity
        # @order.tax = @order.subtotal * 0.091
        # @order.total = @order.subtotal + @order.tax
        # @order.save
        

          redirect_to "/checkout"
      else
        flash[:error] = "Log in, idiot!"
        redirect_to "/login"
      end  
  end

  def index 
    @carted_products = current_user.carted_products.where(status:"carted")
  end

  def destroy
    @carted_products = current_user.carted_products.where(status:"carted")
    test1 = CartedProduct.find_by(id: params[:carted_product_id])

    test1.assign_attributes(quantity: params[:quantity])
    test1.save


    if test1.quantity == 0
       test1.status = "removed"
       test1.save
    end

    flash[:success] = "Cart updated!"
    redirect_to "/checkout"
  end

end  









