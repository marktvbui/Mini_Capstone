class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :calculate_cart_count

  def current_user
    # if session[:user_id]
    #   @current_user = User.find_by(id: session[:user_id])
    #one line if statement for above
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authenticate_user!
    redirect_to '/login' unless current_user
  end

  def current_user_admin
    if !current_user.admin 
      flash[:danger] = "That action is only permited for admins"
      redirect_to "/"
    end
  end

  def calculate_cart_count
    if current_user
      @cart_count = current_user.carted_products.where(status: "carted").count
    else
      @cart_count = 0
    end
  end

end