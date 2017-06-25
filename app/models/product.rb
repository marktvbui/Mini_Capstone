# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  price       :decimal(, )
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  instock     :boolean          default(TRUE)
#  supplier_id :integer
#

class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders
  
  has_many :productcategories
  has_many :categories, through: :productcategories
  
  has_many :carted_products
  has_many :orders, through: :carted_products
  
  validates :name, :price, :description, presence: true
  validates :name, uniqueness: true
  
  validates :price, numericality: {greater_than: 0}
  
  validates :description, length: {maximum: 500}

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
