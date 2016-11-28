class OrdersController < ApplicationController
  # 2. Create an orders_controller. Keep in mind that to keep things RESTful, your checkout form will be making the web request: post "/orders" => 'orders#create' - which means that you'll also be creating an orders controller (that will contain a create action, and then redirect to a show page to show the order confirmation).
  
  def new
  end

  def create
  end


end
