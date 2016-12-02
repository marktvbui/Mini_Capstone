class OrdersController < ApplicationController
  # 2. Create an orders_controller. Keep in mind that to keep things RESTful, your checkout form will be making the web request: post "/orders" => 'orders#create' - which means that you'll also be creating an orders controller (that will contain a create action, and then redirect to a show page to show the order confirmation).
  
  def new
  end

  def create

    if current_user != nil
        @order = Order.new(user_id: current_user.id)
        @carted_products = CartedProduct.where(status: "carted")
          
          @carted_products.each do |cartproduct| 
          @order.subtotal = cartproduct.product.price * cartproduct.quantity
          cartproduct.status = "purchased"
          cartproduct.save
          end
        
        @order.tax = @order.subtotal * 0.091
        @order.total = @order.subtotal + @order.tax
        @order.save

        flash[:success] = "Order purchaed!"
        redirect_to "/products"  
    end  
  end
end


