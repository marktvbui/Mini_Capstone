# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  subtotal   :decimal(, )
#  tax        :decimal(, )
#  total      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
  
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products
  
  validates :subtotal, :tax, :total, presence: true
  
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
