class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  
  def pretty_time
    return created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def sale_message
    if price.to_f < 250
      return "Discount Item!"
    else
      return "On Sale!"
    end

  end

  def tax
    return price.to_f * 0.09
  end

  def total
    return tax + price.to_f
  end









end
