# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  product_id :integer
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Image < ApplicationRecord
  belongs_to :product
  
  validates :url, presence: true
end
