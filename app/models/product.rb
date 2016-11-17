class Product < ApplicationRecord

  
  def pretty_time
    return created_at.strftime("%A, %d %b %Y %l:%M %p")
  end






end
