class Order < ApplicationRecord
  
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products
  

  def calculate_totals
    subtotal = 0
    @carted_products.each do |carted_product| 
      subtotal += carted_product.subtotal
    end

    tax = subtotal * 0.091
    total = subtotal + tax
    update(subtotal: subtotal, tax: tax, total: total)
  end

end
