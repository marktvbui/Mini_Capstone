class Order < ApplicationRecord
  has_many :products
  belongs :user

  def session_quantity
    @session_quantity = session[:quantity]
  end
end
