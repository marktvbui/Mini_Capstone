# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  admin           :boolean          default(FALSE)
#

class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :carted_products
  has_many :products, through: :carted_products

  validates :email, uniqueness: true
  validates :name, presence: true
  
end
