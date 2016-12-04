class OrdersController < ApplicationController
  # 2. Create an orders_controller. Keep in mind that to keep things RESTful, your checkout form will be making the web request: post "/orders" => 'orders#create' - which means that you'll also be creating an orders controller (that will contain a create action, and then redirect to a show page to show the order confirmation).
  
  def new
  end

  def create
    # constance, dont have to set sales_tax everywhere, can just set it once: SALES_TAX = 0.091

    @carted_products = current_user.carted_products.where(status: "carted")
     
    @order = Order.create(user_id: current_user.id)
    @carted_products.update_all(status: "purchased", order_id: order.id)
    order.calculate_totals

    flash[:success] = "Order purchaed!"
    redirect_to "/orders/#{order.id}"  
     

  end

  def show
    @order = Order.find_by(id: params[:id])
  end

end


