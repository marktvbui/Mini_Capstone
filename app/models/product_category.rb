# == Schema Information
#
# Table name: product_categories
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :integer
#  category_id :integer
#

class ProductCategory < ApplicationRecord
  belongs_to :product
  belongs_to :category
end
